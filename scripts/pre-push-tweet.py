#!/usr/bin/python

import sys
import subprocess
from subprocess import Popen, PIPE, STDOUT

remote = sys.argv[0]
if (remote != "origin"):
    print "Not pushing to origin, skipping pre-push-tweet.py"
    sys.exit(0)

get_branch_command = ["git", "symbolic-ref", "--quiet", "HEAD"]
is_on_branch = subprocess.call(get_branch_command)
if (is_on_branch != 0):
    print "Detached head; skipping pre-push-tweet.py"
    sys.exit(0)

branch = subprocess.check_output(get_branch_command).replace("refs/heads/", "").strip()

remote_ref = "refs/remotes/origin/" + branch
check_for_remote_ref = subprocess.call(["git", "show-ref", "--verify", "--quiet", remote_ref])
if (check_for_remote_ref != 0):
    print "Pushing to new branch; skipping pre-push-tweet.py"
    sys.exit(0)

print "Pushing to existing branch, will copy to clipboard: " + branch

push_spec = remote_ref + ".." + branch
messages = subprocess.check_output(["git", "log", push_spec, "--pretty=format:%s"])
line_subjects = messages.split("\n")
joined_subjects = ["'" + msg + "'" for msg in line_subjects]
tweet_message = "Pushing " + str(len(joined_subjects)) + " commits to " + branch + ": " + ", ".join(joined_subjects)

p = Popen(['xclip', '-se', 'c'], stdin=PIPE)
p.communicate(tweet_message)
