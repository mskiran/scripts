#! /bin/bash 
rm ref_file
aws ec2 describe-instances --instance-ids  --query "Reservations[*].Instances[*].{name: Tags[?Key=='Name'] | [0].Value, ip_address: PrivateIpAddress,comp: Tags[?Key=='Component'] |[0].Value}" --output text|sed 's/	/#/g' > ref_file
while read line
do
   IP_LOOKUP=`echo $line|awk -F, {'print $2'}|sed s/\"//g`
   nameresolve=`cat ref_file |grep $IP_LOOKUP |awk -F# {'print $3'}`   
   component=`cat ref_file |grep $IP_LOOKUP |awk -F# {'print $1'}`   
   if [ -z "$nameresolve" ]
   then
      nameresolve=`nslookup \$IP_LOOKUP|grep name |sed 's/.*name = //g'`
      echo $IP_LOOKUP $nameresolve $component
   else
      echo $IP_LOOKUP $nameresolve $component
   fi
    unset nameresolve
done < $1

#awk -F',|, ' 'NR==FNR{a[$2]=$3} NR>FNR{$8=a[$8];print}' OFS=',' "$file2" "$file1"
#NR==FNR{a[$2]=$3} - NR is an awk internal variable which keeps track of the total number of rows read since the program began. FNR is similar, but keeps track of the number of rows of the current file which have been read. So NR==FNR is an awk idiom which means "if this is the first file to be read", and the associated action is a[$2]=$3 which saves the value of field 3 in the array a, with the string index being set to the value of field 2.
#NR>FNR{$8=a[$8];print}' - similar to the previous, but this time operates only on files other than the first to be read. For each line, we use the value of field 8 as the index to look up the value in the array, then re-assign field 8 to the array value. Finally, the whole line is printed .
#OFS=',' "$file2" "$file1" - sets the output field separator to a comma (default is space), then reads in 2 files in the specified order.
#aws ec2 describe-instances --instance-ids  --query "Reservations[*].Instances[*].{name: Tags[?Key=='Name'] | [0].Value, ip_address: PrivateIpAddress, comp: Tags[?Key=='Component'] |[0].Value }" --output text
