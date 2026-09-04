#!/bin/bash

# $1 domain
# $2 problem
# $3 number of plans (k)
# $4 (optional) time-limit (seconds)

TIME_LIMIT_STRING=""
if  [ "$#" -ne 3 ] && [ "$#" -ne 4 ] ; then
    echo "Illegal number of parameters"
elif [ "$#" -eq 3 ] ; then
    TIME_LIMIT_STRING="--overall-time-limit $4"
fi

SOURCE="$(cd "$(dirname "${BASH_SOURCE[0]}")"; pwd)"
export PYTHONPATH=$PWD && $SOURCE/forbiditerative/plan.py --planner diverse_lama --domain $1 --problem $2 --number-of-plans $3 --symmetries --use-local-folder --clean-local-folder ${TIME_LIMIT_STRING} # --suppress-planners-output
