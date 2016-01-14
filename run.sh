# biipy_rdp
# Docker image for bioinformatics analysis.
# This is an *example* run script

biipy_version=v1.3.0
docker pull podpearson/biipy_rdp:${biipy_version}

XSOCK=/tmp/.X11-unix/X0
uid=$(id -u)

docker run -d \
  -v ${HOME}:/home \
  -v /data:/data \
  -v /lustre:/lustre \
  -v /nfs:/nfs \
  -v $XSOCK:$XSOCK \
  -p 38888:8888 \
  --name biipy_rdp_$biipy_version \
  -e "docker_image=$biipy_version" \
  -u ${uid} \
  podpearson/biipy_rdp:${biipy_version}
