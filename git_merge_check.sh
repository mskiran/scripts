line_to_check="git log master --oneline"
line_to_check_canberra="git log canberra --pretty=oneline"

while IFS= read -r var
do 
$line_to_check |grep -e "$var" > /dev/null ; 
if (($? > 0)) 
then 
#echo "$var ---- not found "; 
$line_to_check_canberra|grep -e "$var" > /dev/null ;
if (($? ==  0))
then

git log canberra --pretty=format:"%h %an %s"|grep -e "$var"

fi

fi
done < $1
