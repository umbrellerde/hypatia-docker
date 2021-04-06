# hypatia-docker
https://github.com/snkas/hypatia inside Docker

## Usage

- Clone the Repo `git clone git@github.com:umbrellerde/hypatia-docker.git && cd hypatia-docker`
- Build the container: `docker-compose build` (its 8.25GB big..., this also runs the tests)
- Start the container: `docker-compose up`
- Create a terminal in the container: `docker exec -it hypatia bash`
- To reproduce the paper run `cd paper && chmod +x paper.sh && ./paper.sh`
- If it does not run uncomment the call to `./hypatia_run_tests.sh` in the Dockerfile and rebuild to see what's wrong.
- The folder `./hypatia-io` maps to `/hypatia-io` for I/O