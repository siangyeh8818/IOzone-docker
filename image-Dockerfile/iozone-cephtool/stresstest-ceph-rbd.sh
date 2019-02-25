#!/bin/bash
sleep 5s
echo "測試過程檔案寫入大小 : $FileSize "
echo "測試過程寫入紀錄大小 : $RecordSize "
echo "壓測過程中刪除的pool名稱 : $PoolName "

if [ "$TestModel" = "auto-mode" ];then
   echo "自動全面測試, iozone測試模式選用'0=write/rewrite , 1=read/re-read'"
   echo "測試過程檔案寫入位址 : /mnt/"
   set j=2
   while true
   do
       ./iozone -a -s $FileSize -r $RecordSize -i 0 -i 1  -f /mnt/iozone -Rb ./iozone.xls
       echo "delete object from poll ( $PoolName )................."
       for i in `rados -p $PoolName ls`;
       do
           echo $i; rados -p $PoolName rm $i;
       done
       echo "Finishing to delete object from poll ( $PoolName )"
   done
elif [ "$TestModel" = "throughput" ];then
   echo "吞吐量測試, iozone測試模式選用'0=write/rewrite , 1=read/re-read'"
   echo "並發數 ：$Concurrency"
   cp iozone /mnt
   chmod +x /mnt/iozone
   set j=2
   while true
   do
       bash -c "/mnt/iozone -s $FileSize -r $RecordSize -i 0 -i 1 -t $Concurrency  -Rb ./iozone.xls"
       echo "delete object from poll ( $PoolName )................."
       for i in `rados -p $PoolName ls`;
       do
           echo $i; rados -p $PoolName rm $i;
       done
       echo "Finishing to delete object from poll ( $PoolName )"
   done
else
   echo "can't identify the value of TestModel (env)"
   echo "load default model ........" 
   echo "自動全面測試, iozone測試模式選用'0=write/rewrite , 1=read/re-read'"
   echo "測試過程檔案寫入位址 : /mnt/"
   set j=2
   while true
   do
       ./iozone -a -s $FileSize -r $RecordSize -i 0 -i 1  -f /mnt/iozone -Rb ./iozone.xls
       echo "delete object from poll ( $PoolName )................."
       for i in `rados -p $PoolName ls`;
       do
           echo $i; rados -p $PoolName rm $i;
       done
       echo "Finishing to delete object from poll ( $PoolName )"
   done
fi

sleep inf
