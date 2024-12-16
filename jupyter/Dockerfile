FROM quay.io/jupyter/pytorch-notebook:cuda12-latest

USER root

# Update conda and mamba
RUN conda update -y -n base -c conda-forge conda
RUN mamba update -y -n base -c conda-forge mamba

# Install needed packages
RUN conda install -y -c conda-forge nb_conda_kernels ipykernel nvitop ipywidgets git-lfs

# Startup script, not needed for now
# COPY conda_setup.sh /usr/local/bin/start-notebook.d/

COPY .condarc /home/jovyan/.condarc

COPY jupyter_start.sh /home/jovyan/jupyter_start.sh
RUN chmod +x /home/jovyan/jupyter_start.sh

USER ${NB_UID}

# Create huggingface directory
RUN mkdir /home/jovyan/huggingface
# Set env var for huggingface
ENV HF_HOME=/home/jovyan/huggingface