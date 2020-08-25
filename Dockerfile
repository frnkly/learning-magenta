FROM conda/miniconda3:latest

# Install Google Cloud SDK
RUN apt-get update \
    && apt-get upgrade --assume-yes \
    && echo \
        "deb \
            [signed-by=/usr/share/keyrings/cloud.google.gpg] \
            https://packages.cloud.google.com/apt cloud-sdk main" \
        | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list \
    && apt-get install --assume-yes \
        apt-transport-https \
        build-essential \
        ca-certificates \
        curl \
        git \
        gnupg \
        libasound2-dev \
        libjack-dev \
    && curl https://packages.cloud.google.com/apt/doc/apt-key.gpg \
        | apt-key --keyring /usr/share/keyrings/cloud.google.gpg add - \
    && apt-get update \
    && apt-get install --assume-yes google-cloud-sdk \
    && rm --force --recursive /var/lib/apt/lists/*

# Setup Magenta
RUN bash -c \
        "conda init \
            && source ~/.bashrc \
            && conda create --name magenta --yes python=3.7 \
            && conda activate magenta \
            && pip install --no-cache-dir jupyter magenta"

RUN mkdir /learning
WORKDIR /learning

ENTRYPOINT ["bash"]
