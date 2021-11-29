from ubuntu:20.04

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    entr \
    git \
    git-lfs \
    make \
    python3-pygments \
    sudo \
    texlive-latex-base \
    texlive-latex-extra \
    texlive-pictures \
 && rm -rf /var/lib/apt/lists/*

WORKDIR /workdir

COPY ./scripts/detect_user.sh ./scripts
ENTRYPOINT ["/workdir/scripts/detect_user.sh"]
