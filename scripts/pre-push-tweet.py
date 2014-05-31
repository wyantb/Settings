#!/usr/bin/python

import subprocess

branch = subprocess.check_output(["git", "symbolic-ref", "HEAD"]).replace("refs/heads/", "").strip()
print "Pushing to branch: " + branch

push_spec = "origin/" + branch + ".." + branch
messages = subprocess.check_output(["git", "log", push_spec, "--pretty=format:%s"])
line_subjects = messages.split("\n")
print line_subjects

raise "Boom!  Blowing up to avoid real push."
