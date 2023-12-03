FROM ubuntu:22.04 AS base

RUN export DEBIAN_FRONTEND=noninteractive; apt-get update; \
    apt-get install locales; \
    locale-gen da_DK.UTF-8
