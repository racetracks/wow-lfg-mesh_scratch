#!/bin/sh
# Prints the changelog "before" link for a document (DEC-00026): the git version of PATH as it
# was before the change, i.e. its last commit. Run before committing the change.
# usage: sh before_link.sh <path>   (from inside the repo that holds PATH)
P=$1
[ -n "$P" ] || { echo "usage: before_link.sh <path>"; exit 1; }
H=$(git log -1 --format=%H -- "$P" 2>/dev/null)
[ -n "$H" ] || { echo "before: new"; exit 0; }
U=$(git remote get-url origin | sed -e 's#^git@github.com:#https://github.com/#' -e 's#\.git$##' -e 's#^https://[^@]*@#https://#' -e 's#^http://local_proxy@127.0.0.1:[0-9]*/git/#https://github.com/#')
R=$(git rev-parse --show-prefix)
echo "before [$(echo $H | cut -c1-7)]($U/blob/$H/$R$P)"
