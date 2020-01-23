IMAGE := ministryofjustice/signals-test
VERSION := 0.3

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

deploy:
	kubectl -n dstest apply -f kubernetes.yaml

watch:
	watch kubectl -n dstest get pods

clean:
	kubectl -n dstest delete deployment signals-test
	kubectl -n dstest delete poddisruptionbudget signals-test-pdb
