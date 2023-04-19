# Technology and Analysis of Images and Video

## Intall depencies
python -m venv .venv
source .venv/bin/activate
pip install -r requirement.txt

## Use
* Launch Jupyter Notebook (You can use VScode with extension Jupyter Notebook)
* Select Kernel ".venv"

## Script to translate Notebook
### One by one To fr
python jupyter_translate.py index.ipynb --language 'fr'
### All to fr
This won't translate Notebook who finish by _fr.ipynb and those in folder 'gr'

./translate_all_jupyter.sh

Developed by qyubee
