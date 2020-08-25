# Learning [magenta](https://github.com/magenta/magenta)

<details>
    <summary>Building and publishing Docker image</summary>

```shell
# Build image.
docker build --force-rm --tag frnkly/learning-magenta .

# Publish to Docker hub.
cat ./.docker-hub-token \
    | docker login --username $(cat ./.docker-hub-username) --password-stdin \
    && docker push frnkly/learning-magenta
```
</details>

<details>
    <summary>Creating a VM instance on GCP</summary>

| Paramater | Value |
| --- | --- |
| Machine type | `n2-standard-16` |
| Container image | `docker.io/library/frnkly/learning-magenta:latest` |
| Container options | Always restart, STDIN, TTY |
| Boot disk | Container-optimized OS (latest SDD, 10GB) |
| Service account | Compute engine default |
| Preemptibility | On |
</details>
