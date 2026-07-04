.PHONY: test

deps:
	pip install -r requirements.txt
	pip install -r test_requirements.txt

lint:
	flake8 hello_world test

test:
	PYTHONPATH=. py.test --verbose -s

run:
	python main.py

docker_push:
	docker login -u $(USERNAME) -p $(DOCKER_PASSWORD)
	docker tag hello-world-printer $(USERNAME)/hello-world-printer:latest
	docker push $(USERNAME)/hello-world-printer:latest
	docker logout