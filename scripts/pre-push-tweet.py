#!/usr/bin/python

import re
import sys
import subprocess
from subprocess import Popen, PIPE, STDOUT

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
remote_sha = push_specs[3]
re_empty_ref = re.compile("^0*$")
pushing_to_new_branch = re_empty_ref.match(remote_sha) != None
if (pushing_to_new_branch):
    print "Pushing to a new branch, nothing to copy to clipboard"
    sys.exit(0)

local_sha = push_specs[1]
remote_ref = push_specs[2]
pushing_to = remote_ref.replace("refs/heads/", "")

push_spec = remote_sha + ".." + local_sha
messages = subprocess.check_output(["git", "log", push_spec, "--pretty=format:%s"])
line_subjects = messages.split("\n")
joined_subjects = ["'" + msg + "'" for msg in line_subjects]
tweet_message = "Pushing " + str(len(joined_subjects)) + " commits to " + pushing_to + ": " + ", ".join(joined_subjects)

print "Pushed to existing branch " + pushing_to + ", details copied to clipboard"

p = Popen(['xclip', '-se', 'c'], stdin=PIPE)
p.communicate(tweet_message)
p.stdin.close()
try:
    p.terminate()
except OSError:
    pass

