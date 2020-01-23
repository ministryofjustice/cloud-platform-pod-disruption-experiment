IMAGE := ministryofjustice/signals-test
VERSION := 0.1

build: .built-docker-image

.built-docker-image: Dockerfile makefile signals.rb
	docker build -t $(IMAGE) .
	touch .built-docker-image

push: .built-docker-image
	docker tag $(IMAGE) $(IMAGE):$(VERSION)
	docker push $(IMAGE):$(VERSION)

run:
	docker run --name $(IMAGE) --rm -d $(IMAGE)
	docker logs $(IMAGE) -f

stop:
	docker stop $(IMAGE)

kill:
	docker kill $(IMAGE)
