# Server utils

Starts a jupyter, ngrok and portainer containers.

## Usage

* Add your authenticaion token and adjust the tunnels in `ngrok/ngrok.yml`
* Change the hf cache directory in `docker-compose.yml` for the service `jupyter`
* `docker compose up --build -d`

## Additional setup

### Add password to Jupyter (optional)

* Open a console in Jupyter notebooks using the `conda env:base`
* Generate a password:`from jupyter_server.auth import passwd; passwd('[you_password]')` ([details](https://jupyter-server.readthedocs.io/en/latest/operators/public-server.html#preparing-a-hashed-password))
* Paste the password in `jupyter/jupyter_start.sh` for the argument `--PasswordIdentityProvider.hashed_password`
* Rebuild and restart docker container: `docker compose up --build -d jupyter`

## Notes

* [Conda configuration documentation](https://docs.conda.io/projects/conda/en/latest/configuration.html)
* [Jupyter Docker documentation](https://jupyter-docker-stacks.readthedocs.io/en/latest/index.html)
* [Ngrok documentation](https://ngrok.com/docs/http/)
* [Portainer API documentation](https://docs.portainer.io/api/docs)