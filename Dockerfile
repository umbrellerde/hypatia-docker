FROM ubuntu:20.04
ARG DEBIAN_FRONTEND=noninteractive
LABEL maintainer="umbrellerde"

ENV TZ Europe/Berlin
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
# So that debconf does not ask for keyboard configuration
RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections
RUN apt-get update && apt-get install -y --no-install-recommends git apt-transport-https ca-certificates sudo python3-dev python3-pip unzip gcc g++ mpic++ openssh-client screen apt-utils gnuplot && apt-get clean && rm -rf /var/lib/apt/lists/*
RUN update-ca-certificates
# Create symlink from pip3 to pip / python3 to python...
# #ThanksUbuntu
RUN ln -s /usr/bin/pip3 /usr/bin/pip && ln -s /usr/bin/python3 /usr/bin/python

# --recursive: Also get the basis-sim submodule
RUN git clone https://github.com/snkas/hypatia.git --recursive
WORKDIR hypatia

# Prepare install_deps file and run it
RUN sed -i 's/sudo apt-get install/sudo apt-get install -y/g' hypatia_install_dependencies.sh && chmod +x ./hypatia_install_dependencies.sh && ./hypatia_install_dependencies.sh && apt-get clean && rm -rf /var/lib/apt/lists/*
# Build it
RUN chmod +x hypatia_build.sh && ./hypatia_build.sh

# Run tests
# RUN chmod +x hypatia_run_tests.sh && ./hypatia_run_tests.sh

# Setup the folders so that not everything is owned by root
RUN chown -R 1000:1000 .
RUN mkdir /hypatia-io
RUN chown -R 1000:1000 /hypatia-io