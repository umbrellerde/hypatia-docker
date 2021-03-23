# hypatia-docker
https://github.com/snkas/hypatia inside Docker

## Usuage

- Clone the Repo `git clone git@github.com:umbrellerde/hypatia-docker.git && cd hypatia-docker`
- Build the container: `docker-compose build` (its 5.5GB big..., this also runs the tests)
- Start the container: `docker-compose up`
- Create a terminal in the container: `docker exec -it hypatia bash`
- To reproduce the paper run `cd paper && chmod +x paper.sh && ./paper.sh`
- The folder `./hypatia-io` maps to `/hypatia-io` for I/O