FROM python:3-slim-stretch
MAINTAINER Paul Wellner Bou "<paul@wellnerbou.de>"

RUN apt-get update && apt-get install -y git-core libgit2-24 libgit2-dev build-essential libffi-dev
RUN git clone https://github.com/aspiers/git-deps.git

RUN pip3 install pygit2==0.24 flask
RUN cd git-deps && python3 setup.py install

RUN mkdir -p /src
VOLUME /src
WORKDIR /src

EXPOSE 5000

CMD ["git", "deps", "--serve", "--bind-ip=0.0.0.0"]
