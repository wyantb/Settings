#!/usr/bin/python

import subprocess

branch = subprocess.check_output(["git", "symbolic-ref", "HEAD"]).replace("refs/heads/", "").strip()
print "Pushing to branch: " + branch

push_spec = "origin/" + branch + ".." + branch
messages = subprocess.check_output(["git", "log", push_spec, "--pretty=format:%s"])
line_subjects = messages.split("\n")
joined_subjects = ["'" + msg + "'" for msg in line_subjects]
tweet_message = "Pushing " + str(len(joined_subjects)) + " commits to " + branch + ": " + ", ".join(joined_subjects)
subprocess.call("echo \"" + tweet_message + "\"| xclip " + "-se c", shell=True)
