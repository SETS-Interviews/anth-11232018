#!/bin/sh

# Ask for github repository
echo What is the name of the github repo \(e.g. user/reponame\)?
read REPO_NAME

# Ask for output file name
echo Where to save results \{e.g. output.log\}?
read LOG_OUTPUT

# VARIABLES
GITREPO='https://github.com/'$REPO_NAME''

# Run gittyleaks script and check github repo for sensitive information
gittyleaks --find-anything --verbose -link $GITREPO | tee $LOG_OUTPUT

# Confirm success or failure
if [ $? -eq 0 ]
then
  echo "Done.  Script ran successfully.  Check the $LOG_OUTPUT"
else
  echo "Failed could not complete" >&2
fi
