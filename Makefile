setup:
	python3 -m venv ~/.flask-ml-azure
	source ~/.flask-ml-azure/bin/activate

install:
	pip install --upgrade pip &&\
		pip install --user -r requirements.txt
	
lint:
	pylint --disable=R,C,W1203 app.py

test:
	python -m pytest -vv test_hello.py


all: install lint test