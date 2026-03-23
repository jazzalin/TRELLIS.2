FROM nvcr.io/nvidia/pytorch:24.04-py3
WORKDIR /workspace/
ADD . /workspace/
RUN apt-get update && apt-get install -y wget && \
    wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O /miniconda.sh && \
    bash /miniconda.sh -b -p /opt/conda && \
    rm /miniconda.sh && \
    rm -rf /var/lib/apt/lists/*
ENV PATH="/opt/conda/bin:$PATH"
RUN ./setup.sh --new-env --basic --flash-attn --nvdiffrast --nvdiffrec --cumesh --o-voxel --flexgemm
ENTRYPOINT ["/bin/bash"]