# IOzone-docker

IOzone是一個測試磁碟效能的基準工具
導入新的Storage 方案 , 例如Ceph
那你需要比較CephFS , Ceph-RBD , Ceph-Object-tool分別的效能時
可以用該工具當作一個基本測試的tool

### How to build
```
cd image-Dockerfile
cd iozone-cephtool 或是 cd iozone

iozone 提供基本的'自動全面測試' 跟'吞吐量測試'
iozone-cephtool 則是可以控制寫入模塊笑小 , RBD測試專用

docker build -t="YOUR DOCKER NAME" .
```

### How to run
```
cd deploy/kubernetes
kubectl apply -f deployment.yaml -n <YOUR NAMESPACES>
```
