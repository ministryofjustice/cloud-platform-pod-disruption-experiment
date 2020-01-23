# Pod disruption experiment

## Deploy the container

* Edit the code to make any changes.
* Ensure the namespace defined in the `deploy` makefile target is correct.
* Ensure `makefile` and `kubernetes.yaml` both specify the correct `VERSION`

```
make push
make deploy
```

Get the pod name with `kubectl -n dstest get pods` (or whichever namespace
you're using), then tail the logs with:

```
kubectl -n dstest logs [pod name] -f
```

## Watch pod statuses

In a separate window:

```
watch kubectl -n dstest get pods
```

## Delete the pod

In a separate window:

```
kubectl -n dstest delete pod [pod name]
```

Or

```
kubectl -n dstest delete pod [pod name] --grace-period=5
```

## Clean up

```
kubectl -n dstest delete deployment signals-test
```
