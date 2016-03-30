#!/bin/bash
source helpers/travis.sh
set -ev

# If this is a commit in a pull-request, run tests...
if isPullRequest; then
  echo 'Running test scripts....'
  make test

# Otherwise, if this is commit against the main branch and we're NOT in a
# pull-request, run release scripts.
elif isOnBranch "master" && ! isPullRequest && [ $GIT_HEAD_TAG -eq 0 ]; then
  echo 'Atempting version bump....'
  git config --local user.name "helior"
  git config --local user.email "me@helior.info"

  make bump
fi
