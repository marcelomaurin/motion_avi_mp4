#!/bin/bash


quebrar() {
	local filepath="$1"
	local filename=$(basename "$filepath")
	local ext=$(echo "$filename"| awk -F '.' '{ if (NF==2) {print $NF} else if ( NF>2) {print $(NF-1)"."$NF} }')
	local dir=$(echo "$filepath" | awk -F '/' '{ print substr($0, 0 , length($0)-length($NF)-1) }')
	echo -e "$dir""\t""$filename""\t""$ext"
}

echo $0 >> /projetos/sosconsulta/linux/analisa_img/logpar0.txt
echo $1 >> /projetos/sosconsulta/linux/analisa_img/logpar.txt
echo $1
echo "enviou log"

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
echo "Processou arquivo "$novoarquivo >> //projetos/sosconsulta/linux/analisa_img/logfim.txt

rm -f $1

