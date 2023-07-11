# zl-init-container

zk-init-container is a container that runs as an init container in the target pod. This container keeps hitting a target url until it receives OK response. This is useful in cases where the target pod is waiting for a dependent pod to serve requests.

### Building the image

Run this command will build the server and push the updated image to docker.

```
make buildAndPush
```


### Usage

zk-init-container reads from the environment variable `URL` and keeps hitting the url until it receives OK response. Please refer to the testDeployment.yaml for an example of how to use this container.