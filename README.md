# Learning [magenta](https://github.com/magenta/magenta)

<details>
    <summary>Building and publishing Docker image</summary>

```shell
# Build image.
docker rmi frnkly/learning-magenta
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
| Boot disk | Container-optimized OS (latest SDD, 50GB) |
| Service account | Compute engine default |
| Preemptibility | On |
</details>

<details>
    <summary>Setting up dev environment</summary>

```shell
# Create Docker container
docker run --interactive --tty --rm frnkly/learning-magenta

# Initialize gcloud
gcloud init --console-only

# Setup magenta
git clone https://github.com/magenta/magenta.git --depth 1 \
    && cd magenta/magenta/models/sketch_rnn \
    && mkdir data logs

# Download a subset of the airplane dataset
gsutil -m cp -r gs://quickdraw_dataset/sketchrnn/airplane.npz data/airplane.npz

# Download the full airplane dataset
gsutil -m cp -r gs://quickdraw_dataset/sketchrnn/airplane.full.npz data/airplane.full.npz

# Download the full dataset
gsutil -m cp -r gs://quickdraw_dataset/sketchrnn ./data
```
</details>

## Training the Sketch RNN model

```shell
conda activate magenta
python sketch_rnn_train.py --log_root=logs --data_dir=data --hparams="data_set=[airplane.npz]"
```
