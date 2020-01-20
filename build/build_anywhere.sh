#!/bin/bash
PROG='genkubeconf'
LPROG="${PROG}-linux"
BUILD="compile_${PROG}"
GID=$(id -g $USER)
docker build . --target builder -t ${BUILD} && \
mkdir -p $PWD/${LPROG} && \
docker run --user $UID:$GID --rm -v $PWD/${LPROG}:/app ${BUILD} cp /bin/${PROG} /app && \
sudo chown $USER:$GID $PWD/${LPROG}/${PROG}
cp -r examples LICENSE README.md ${LPROG}
mkdir -p releases
tar -czvf releases/${LPROG}.tar.gz ${LPROG}
