#!/bin/sh

# sync anjia0532 to tencentyun.com
# https://github.com/anjia0532/gcr.io_mirror


images="
google-containers/heapster-influxdb-amd64:v1.1.1
google-containers/heapster-influxdb-amd64:v1.3.3
google-containers/heapster-amd64:v1.5.4
google-containers/heapster-grafana-amd64:v4.4.3
google-containers/kube-state-metrics-amd64:v1.4.0
google-containers/kube-state-metrics-amd64:v1.3.1
google-containers/elasticsearch:v5.6.4
google-containers/fluentd-elasticsearch:v2.0.2
google-containers/kubernetes-dashboard-amd64:v1.10.0
google-containers/metrics-server-amd64:v0.3.1
google-containers/kubernetes-dashboard-amd64:v1.8.3
"
src_url="anjia0532"
dst_url="ccr.ccs.tencentyun.com"
docker=/usr/local/bin/docker

for image in $images 
do
  src_image=${image/\//.}
  dst_image="weimob-k8s-${image}"
  $docker pull ${src_url}/${src_image}
  $docker tag ${src_url}/${src_image} ${dst_url}/${dst_image} 
  $docker push ${dst_url}/${dst_image} 
  $docker rmi -f ${src_url}/${src_image} ${dst_url}/${dst_image} 
  #echo $src_image  $dst_image
done
