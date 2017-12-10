#HEADERS = program.h headers.h

CC= gcc
MYSQLCFLAGS= -I/usr/include/mysql -DBIG_JOINS=1 -fno-strict-aliasing -g
MYSQLLIBS= -L/usr/lib/mysql -lmysqlclient  -lpthread -lz -lm -lrt -ldl


default: run

all:  clean install run 

compile:	
	#$(CC) main.cpp -g -o srvSMS $(MYSQLCFLAGS) $(MYSQLLIBS)

clean:
	#rm -f srvSMS
	rm -f /usr/local/bin/analisa_img.sh
	rm -f /usr/local/bin/analisa_avi.sh
	
run:
	#/etc/init.d/smstools stop
	#/usr/local/bin/analista_img
	#/etc/init.d/smstools start

install:
	#update-rc.d srvSMS remove
	#cp ./facedetect /usr/local/bin/
	cp analisa_img.sh /usr/local/bin/analisa_img.sh
	cp analisa_avi.sh /usr/local/bin/analisa_avi.sh
	chmod +x /usr/local/bin/analisa_img.sh
	chmod +x /usr/local/bin/analisa_avi.sh
	#update-rc.d srvSMS defaults


