#!/usr/bin/python

import re
import sys
import subprocess

remote = sys.argv[1]
if (remote != "origin"):
    # TODO maybe instead just prefix with remote/branch if not to origin
    print "Not pushing to origin, skipping pre-push-tweet.py"
    sys.exit(0)

push_details = sys.stdin.readlines()
if (len(push_details) == 0):
    print "Not pushing anything, skipping pre-push-tweet.py"
    sys.exit(0)

push_specs = push_details[0].strip().split(" ") # TODO I suppose I could push more than one at once...
# also, 0 === local_ref e.g. refs/heads/master
local_sha = push_specs[1]
remote_sha = push_specs[3]
re_empty_ref = re.compile("^0*$")
check_empty_shas = (re_empty_ref.match(local_sha) != None) or (re_empty_ref.match(remote_sha) != None)
if (check_empty_shas):
    print "Pushing to a new branch or deleting a branch, nothing to copy to clipboard"
    sys.exit(0)

remote_ref = push_specs[2]
pushing_to = remote_ref.replace("refs/heads/", "")

push_spec = remote_sha + ".." + local_sha
messages = subprocess.check_output(["git", "log", push_spec, "--pretty=format:%s"])
line_subjects = messages.split("\n")
joined_subjects = ["'" + msg + "'" for msg in line_subjects]
tweet_message = "Pushing " + str(len(joined_subjects)) + " commits to " + pushing_to + ": " + ", ".join(joined_subjects)

print "Pushed to existing branch " + pushing_to + ", details copied to clipboard"

# Fairly robust paste, from http://stackoverflow.com/a/7606100
def paste(str, p=True, c=True):
    from subprocess import Popen, PIPE

    if p:
        p = Popen(['xsel', '-pi'], stdin=PIPE)
        p.communicate(input=str)
    if c:
        p = Popen(['xsel', '-bi'], stdin=PIPE)
        p.communicate(input=str)

paste(tweet_message)

