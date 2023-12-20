#git submodule foreach $(pwd -P)/bashscripts/test.sh
#git submodule foreach $( dirname -- "${BASH_SOURCE[0]}" )/test.sh
git submodule foreach $( readlink -f -- "$0";)
#ls
#echo "The script you are running has:"
#echo "basename: [$(basename "$0")]"
#echo "dirname : [$(dirname "$0")]"
echo "pwd     : [$(pwd)]"
#echo " :[$dirname -- "$( readlink -f -- "$0"; )"";
