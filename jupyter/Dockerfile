FROM jupyter/minimal-notebook:latest

USER root

RUN mamba install -c conda-forge nb_conda_kernels
RUN mamba install -c conda-forge ipykernel
RUN mamba install nvitop

# COPY conda_setup.sh /usr/local/bin/start-notebook.d/

COPY .condarc /home/jovyan/.condarc

COPY jupyter_start.sh /home/jovyan/jupyter_start.sh
RUN chmod +x /home/jovyan/jupyter_start.sh

USER ${NB_UID}