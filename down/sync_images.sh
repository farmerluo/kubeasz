#!/bin/sh


images="
metrics-server-amd64:v0.3.1
kube-state-metrics:v1.3.1
cluster-autoscaler:v1.2.0
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
