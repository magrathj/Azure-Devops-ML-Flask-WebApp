setup:
	python3 -m venv ~/.myrepo

install:
	pip install --upgrade pip &&\
		pip install --user -r requirements.txt

test:
	python -m pytest -vv test_hello.py


all: install test