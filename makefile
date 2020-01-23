TAG := signals-test

build:
	docker build -t $(TAG) .

run:
	docker run --name $(TAG) --rm -d $(TAG)
	docker logs $(TAG) -f

stop:
	docker stop $(TAG)

kill:
	docker kill $(TAG)


