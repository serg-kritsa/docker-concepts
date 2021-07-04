# syntax = docker/dockerfile:1
FROM node:alpine

WORKDIR /app

COPY package*.json ./

RUN --mount=type=cache,target=/root/.npm/_cacache npm install

