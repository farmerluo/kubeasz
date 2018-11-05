#!/bin/sh


images="
kubernetes-dashboard-amd64:v1.10.0
"
src_url="mirrorgooglecontainers"
dst_url="ccr.ccs.tencentyun.com/weimob-k8s"
docker=/usr/local/bin/docker

for image in $images 
do
  $docker pull ${src_url}/${image}
  $docker tag ${src_url}/${image} ${dst_url}/${image} 
  $docker push ${dst_url}/${image} 
  $docker rmi -f ${src_url}/${image} ${dst_url}/${image} 
done
