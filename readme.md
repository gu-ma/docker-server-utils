# Server utils

Start a jupyter, ngrok, portainer, nvitop, and filebrowser containers.

## Usage

- Add your authentication token and adjust the tunnels in `ngrok/ngrok.yml`
- Pull submodules `git submodule update --init --recursive` (for nvitop)
- In `.env` change as needed:
  - `HF_HOME` Huggingface cache directory
  - `TORCH_HOME` Torch cache directory
  - `FB_DIR...` Directories for Filebrowser (adjust in `docker-compose.yml` as well)
  - No need to change the UID and GID for Filebrowser normally
- `docker compose up --build -d`

## Additional setup

### Add password to Jupyter (optional)

- Open a console in Jupyter notebooks using the `conda env:base`
- Generate a password:`from jupyter_server.auth import passwd; passwd('[you_password]')` ([details](https://jupyter-server.readthedocs.io/en/latest/operators/public-server.html#preparing-a-hashed-password))
- Paste the password in `jupyter/jupyter_start.sh` for the argument `--PasswordIdentityProvider.hashed_password`
- Rebuild and restart docker container: `docker compose up --build -d jupyter`

### Filebrowser setup

- Login to FB and **change the default admin password**
- Create users with specific access rights

## Notes

- [Conda configuration documentation](https://docs.conda.io/projects/conda/en/latest/configuration.html)
- [Jupyter Docker documentation](https://jupyter-docker-stacks.readthedocs.io/en/latest/index.html)
- [Ngrok documentation](https://ngrok.com/docs/http/)
- [Portainer API documentation](https://docs.portainer.io/api/docs)
- [Nvitop repo](https://github.com/XuehaiPan/nvitop)
- [Filebrowser Docker documentation](https://filebrowser.org/installation#docker)
