#!/bin/sh

WRONG_EMAIL=$1
CORRECT_NAME=$2
CORRECT_EMAIL=$3

git filter-branch --env-filter '

an="$GIT_AUTHOR_NAME"
am="$GIT_AUTHOR_EMAIL"
cn="$GIT_COMMITTER_NAME"
cm="$GIT_COMMITTER_EMAIL"

if [ "$GIT_COMMITTER_EMAIL" = "$WRONG_EMAIL" ]
then
    cn="$CORRECT_NAME"
    cm="$CORRECT_EMAIL"
fi
if [ "$GIT_AUTHOR_EMAIL" = "$WRONG_EMAIL" ]
then
    an="$CORRECT_NAME"
    am="$CORRECT_EMAIL"
fi

export GIT_AUTHOR_NAME="$an"
export GIT_AUTHOR_EMAIL="$am"
export GIT_COMMITTER_NAME="$cn"
export GIT_COMMITTER_EMAIL="$cm"
'
