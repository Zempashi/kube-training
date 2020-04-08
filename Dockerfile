from ubuntu:19.10

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    make \
    git \
    git-lfs \
    python3-pygments \
    texlive-latex-base \
    texlive-latex-extra \
    texlive-pictures \
 && rm -rf /var/lib/apt/lists/*

WORKDIR /workdir

ARG USER_ID=1000

RUN [ "${USER_ID}" -eq "0" ] || \
    (useradd -u ${USER_ID} -U -m -d /home/builder builder \
 && chown builder /workdir)

USER ${USER_ID}
