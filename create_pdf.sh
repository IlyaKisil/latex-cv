#!/usr/bin/env bash

set -e

function help() {

local _FILE_NAME
_FILE_NAME=`basename ${BASH_SOURCE[0]}`

cat << HELP_USAGE

Description:
    Compiles latex document into pdf with 'xelatex'.

Usage: ${_FILE_NAME} --file=<FILE_NAME> [-h|--help]
    [--aux-dir=<AUX_DIR>] [--clean] [--force-clean]

Options:
    -h|--help
        Show this message.

    --file=<FILE_NAME>
        Defines the name of file for which pdf will be generated.
        Must have file extension ('*.tex').

    --aux-dir=<AUX_DIR>
        Defines where so-generated auxiliary files are placed.
        Default is './build'.

    --clean
        Clean auto-generated auxiliary files (*.aux, *.log, *.out,).
        Files to be deleted are defined by '--file=' located in '--aux-dir='
        or their default values.

    --full-clean
        Extends option '--clean' and removes build files (*.pdf)

Examples:
    ${_FILE_NAME} --file=my_main.tex
        Use 'my_main.tex' to produce pdf document with 'latexmk'.

    ${_FILE_NAME} --file=my_main.tex --aux-dir=tmp
        Store all so-generated files in './tmp'.

    ${_FILE_NAME} --file=my_main.tex --clean --aux-dir=tmp
        Auxiliary files that are located in './tmp' and match
        pattern 'my_main.[AUX_EXTENSIONS]' will be removed.

    ${_FILE_NAME} --file=my_main.tex --full-clean --aux-dir=tmp
        Removes 'my_main.[AUX_EXTENSIONS]' and 'my_main.[BUILD_EXTENSIONS]'
        from the './tmp' directory.

Author:
    Ilya Kisil <ilyakisil@gmail.com>

Report bugs to ilyakisil@gmail.com.

HELP_USAGE
}


### Default values for variables
CREATE_PDF=`basename ${BASH_SOURCE[0]}`
FILE=""
AUX_DIR="build"
CLEAN=0
# Files with these extensions are removed when 'CLEAN=1'
declare -a AUX_EXTENSIONS=(".aux"
                           ".log"
                           ".out"
                           )
# Files with these extensions are removed when 'CLEAN=2' (extends 'CLEAN=1')
declare -a BUILD_EXTENSIONS=(".pdf"
                             )


### Parse arguments
for arg in "$@"; do
    case ${arg} in
        -h|--help)
            help
            exit
            ;;
        --file=*)
            FILE="${arg#*=}"
            ;;
        --aux-dir=*)
            AUX_DIR="${arg#*=}"
            ;;
        --clean)
            CLEAN=1
            ;;
        --full-clean)
            CLEAN=2
            ;;
        *)
            # Skip unknown option
            ;;
    esac
    shift
done


### Define new variables with respect to the parsed arguments
file_name="${FILE%.*}"
if [[ -z ${AUX_DIR} ]]; then
    aux_home=${PWD}
else
    aux_home=${PWD}/${AUX_DIR}
fi

function compile () {
    echo "INFO $CREATE_PDF: Creating pdf with 'xelatex'"
    if [[ ! -d ${aux_home} ]]; then
        mkdir -p ${aux_home}
    fi
    xelatex -output-directory=${aux_home} ${FILE}
}

function clean_aux() {
    local file
    echo "INFO $CREATE_PDF: Removing auto-generated auxiliary files."
    for extension in "${AUX_EXTENSIONS[@]}"
    do
        file=${aux_home}/${file_name}${extension}

        if [[ -f ${file} ]]; then
            rm ${file}
        fi
    done
}

function clean_build() {
    local file
    echo "INFO $CREATE_PDF: Removing build files."
    for extension in "${BUILD_EXTENSIONS[@]}"
    do
        file=${aux_home}/${file_name}${extension}

        if [[ -f ${file} ]]; then
            rm ${file}
        fi
    done

}


##########################################
#--------          MAIN          --------#
##########################################

if [[ -z ${FILE} ]]; then
    echo "ERROR $CREATE_PDF: Required option hasn't been specified" >&2
    echo "Example of correct usage: $CREATE_PDF --file=my_file.tex" >&2
    exit 1
fi

if [[ ${FILE} != *.tex ]]; then
    echo "ERROR $CREATE_PDF: This script can only be used for files with LaTeX extension (*.tex)" >&2
    echo "$FILE" >&2
    exit 1
fi

if [[ ! -f ${FILE} ]]; then
    echo "ERROR $CREATE_PDF: Specified source file does not exist." >&2
    echo "$FILE" >&2
    exit 1
fi

if [[ (${CLEAN} == 0) ]]; then
    compile
elif [[ (${CLEAN} == 1) ]]; then
    clean_aux
elif [[ (${CLEAN} == 2) ]]; then
    clean_aux
    clean_build
fi

echo "INFO $CREATE_PDF: Success :-)"
