FROM ubuntu:22.04 AS base

RUN export DEBIAN_FRONTEND=noninteractive; apt-get update; \
    apt-get install locales; \
    locale-gen da_DK.UTF-8
FROM ubuntu:22.04 AS final

COPY --from=base /usr/lib/locale/locale-archive /usr/lib/locale/locale-archive
