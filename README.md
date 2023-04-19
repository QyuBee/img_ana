python -m venv .venv

source .venv/bin/activate

pip install -r requirement.txt

python jupyter_translate.py index.ipynb --language 'fr'

./translate_all_jupyter.sh