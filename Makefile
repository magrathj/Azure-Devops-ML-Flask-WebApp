setup:
	python3 -m venv ~/.flask-ml-azure
	source ~/.flask-ml-azure/bin/activate

install:
	pip install --upgrade pip &&\
		pip install --user -r requirements.txt

lint:
	python -m pip install flake8
	flake8 .

test:
	python -m pytest -vv test_hello.py --doctest-modules --junitxml=junit/test-results.xml 

all: install lint test