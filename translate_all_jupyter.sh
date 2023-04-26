#!/bin/bash
# 1. Create ProgressBar function
# 1.1 Input is currentState($1) and totalState($2)
function ProgressBar {
    # Process data
    let _progress=(${1} * 100 / ${2} * 100)/100
    let _done=(${_progress} * 4)/10
    let _left=40-$_done
    # Build progressbar string lengths
    _fill=$(printf "%${_done}s")
    _empty=$(printf "%${_left}s")

    # 1.2 Build progressbar strings and print the ProgressBar line
    # 1.2.1 Output example:
    # 1.2.1.1 Progress : [########################################] 100%
    printf "\rProgress : [${_fill// /#}${_empty// /-}] ${_progress}%%"

}

# Variables
_start=1

# This accounts as the "totalState" variable for the ProgressBar function
_end=100

# Get the number of directories containing "*.ipynb" files (excluding those in ".venv" directory)
step=$(find -name "*.ipynb" -not -path "./.venv/*" -not -path "*gr/*" -not -regex '.*_fr.ipynb' -print -type d | wc -l)

find -name "*.ipynb" -not -path "./.venv/*" -not -path "*gr/*"  -not -regex '.*_fr.ipynb' -print -type f |
    while read file; do
        # echo
        # echo "Translating file: $file"
        # run your code at this point
        ProgressBar "${_start}" "${_end}"
        gr_dir="$(dirname -- "$(realpath -- "$file")")/gr"
        python jupyter_translate.py "$file" --language 'fr'
        mkdir -p $gr_dir 
        mv "$file" $gr_dir
        ((_start += 100 / step))
    done

ProgressBar "${_end}" "${_end}"
echo -e "\nTranslation complete!"
