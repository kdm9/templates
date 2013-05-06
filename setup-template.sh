#!/bin/bash

#####  GET OPTIONS #####
function help {
    echo -e "\n\nsetup-template.sh:\n"
    echo "USAGE:"
    echo -e "\tsetup-template.sh -t <template> [ -d <template directory> ]"
    exit 1
}

# Do getopts loop
while getopts :t:d: flag
do
    case $flag in
        t)
            Template="$OPTARG"
            ;;
        d)
            TemplateDir="$OPTARG"
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
    TemplateDir="$(readlink -f $0)"
fi

if [ -z "$Template" ]
then
    echo "ERROR: You must supply a template"
    help
fi

# Move files.

if [ -d "${TemplateDir}/${Template}" ]
then
    # Copy scaffold
    cp -rL ${TemplateDir}/${Template} .
    find -name .gitkeep -delete
else
    echo "ERROR: No files to copy for template '${Template}'"
    help
fi
