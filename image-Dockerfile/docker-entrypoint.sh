#!/bin/bash

echo "測試過程檔案寫入大小 : $FileSize "
echo "測試過程寫入紀錄大小 : $RecordSize "


if [ "$TestModel" = "auto-mode" ];then
   echo "自動全面測試, iozone測試模式選用'0=write/rewrite , 1=read/re-read'"
   echo "測試過程檔案寫入位址 : /mnt/"
   ./iozone -a -s $FileSize -r $RecordSize -i 0 -i 1  -f /mnt/iozone -Rb ./iozone.xls
elif [ "$TestModel" = "throughput" ];then
   echo "吞吐量測試, iozone測試模式選用'0=write/rewrite , 1=read/re-read'"
   echo "並發數 ：$Concurrency"
   cp iozone /mnt
   chmod +x /mnt/iozone
   bash -c "/mnt/iozone -s $FileSize -r $RecordSize -i 0 -i 1 -t $Concurrency  -Rb ./iozone.xls"
else
   echo "can't identify the value of TestModel (env)"
   echo "load default model ........" 
   echo "自動全面測試, iozone測試模式選用'0=write/rewrite , 1=read/re-read'"
   echo "測試過程檔案寫入位址 : /mnt/"
   ./iozone -a -s $FileSize -r $RecordSize -i 0 -i 1  -f /mnt/iozone -Rb ./iozone.xls
fi

sleep inf
