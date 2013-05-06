#!/bin/bash

#####  GET OPTIONS #####
function help {
    echo -e "\n\nsetup-template.sh:\n"
    echo "USAGE:"
    echo -e "\tsetup-template.sh -t <template> [ -d <template directory> ]"
    echo -e "\tsetup-template.sh -l [ -d <template directory> ]"
    exit 1
}

# Do getopts loop
while getopts :t:d:l flag
do
    case $flag in
        t)
            Template="$OPTARG"
            ;;
        d)
            TemplateDir="$OPTARG"
            ;;
        l)
            List="Yes"
            ;;
        *)
            echo "ERROR: bad argument $flag"
            help
            ;;
    esac
done

if [ -n "$TemplateDir" ]
then
    if [ ! -d "$TemplateDir" ]
    then
        echo "ERROR: Template directory '$TemplateDir' does not exist"
        help
    fi
else
    TemplateDir="$( cd "$( dirname "$0" )" && pwd )"
fi

if [[ -z "$Template" && -z "$List" ]]
then
    echo "ERROR: You must supply a template"
    help
fi

if [ -n "$List" ]
then
    echo -e "Valid templates are:\n"
    find "${TemplateDir}" -maxdepth 1 -mindepth 1 -type d |rev |cut -d "/" -f 1 |rev
    exit 0
fi

# Move files.

if [ -d "${TemplateDir}/${Template}" ]
then
    # Copy scaffold
    cp -rL ${TemplateDir}/${Template}/* .
    mv gitignore .gitignore
    find -name .gitkeep -delete
else
    echo "ERROR: No files to copy for template '${Template}'"
    help
fi
