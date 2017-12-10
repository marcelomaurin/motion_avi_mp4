#!/bin/bash


quebrar() {
	local filepath="$1"
	local filename=$(basename "$filepath")
	local ext=$(echo "$filename"| awk -F '.' '{ if (NF==2) {print $NF} else if ( NF>2) {print $(NF-1)"."$NF} }')
	local dir=$(echo "$filepath" | awk -F '/' '{ print substr($0, 0 , length($0)-length($NF)-1) }')
	echo -e "$dir""\t""$filename""\t""$ext"
}

ret="$(quebrar "$1")"
echo "$diretorio: " "$(echo "$ret" | cut -f1)"
diretorio="$(echo "$ret"|cut -f1)"
filename="$(echo "$ret"| cut -f2)"
somentefilename="$(echo "$filename"| cut -d. -f1)"
extensao="$(echo "$filename"| cut -d. -f2)"
novoarquivo="$(echo "$1"| cut -d. -f1)"
novoarquivo="$(echo "$novoarquivo"".mp4")"

#echo "Desmembramento do arquivo"
#echo $diretorio
#echo $somentefilename
#echo $extensao
#echo $filename
echo $novoarquivo


ffmpeg  -i $1 -c:v libx264 -preset ultrafast $novoarquivo

rm -f $1

