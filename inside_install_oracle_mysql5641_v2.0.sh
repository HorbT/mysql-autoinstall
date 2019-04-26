#!/bin/bash
#MySQL Install Script Version 2.0 For MySQL 5.6
#OS Version : CentOS-6-Update-8
#Database Version: 5.6.41

#Define display colour
#30-Black 31-Red 32-Green 33-Yellow 34-Blue 35-Purple 36-Dark Green 37-White

#Please put this scripts and MySQL software to /tmp directory then execute
#MySQL sofware directory is soft
#MySQL install directory is basepath and the directory named rule define /mnt/mysql$version
#MySQL data directory is datapath and the directory named rule define /data/ane$port
#MySQL binlog directory is binlogpath and the directory named rule define /data/binlog$port
#MySQL port directory is port
#MySQL server id is serverid

echo -e " \n\e[1;36m |-----------------------------------------------------------------------------------------------------------------------------------------------------| \e[0m "
echo -e " \n\e[1;36m |                                                                                                                                                     | \e[0m "
echo -e " \n\e[1;36m |                '++.                                                                                                                                 | \e[0m "
echo -e " \n\e[1;36m |               oo+oo+.                                                                                                                               | \e[0m "
echo -e " \n\e[1;36m |             .+o++++o+o                                                                                                                              | \e[0m "
echo -e " \n\e[1;36m |             o+++++++++o                                                                                                                             | \e[0m "
echo -e " \n\e[1;36m |            o++++++++++oo                                                                                                                            | \e[0m "
echo -e " \n\e[1;36m |            o+++++++++++o;                                                                                                                           | \e[0m "
echo -e " \n\e[1;36m |            oo++++++++++oo                                                                                                                           | \e[0m "
echo -e " \n\e[1;36m |            o++++++++++++o+                                                                                                                          | \e[0m "
echo -e " \n\e[1;36m |             ++++++++++++++o                                                                                                                         | \e[0m "
echo -e " \n\e[1;36m |             ++++++++++++++++                                                                                                                        | \e[0m "
echo -e " \n\e[1;36m |              o++++++++++++++                                                               'oooo,                                                   | \e[0m "
echo -e " \n\e[1;36m |               oo+++++++++++o+                                                          'ooo+ooo+++                                                  | \e[0m "
echo -e " \n\e[1;36m |                ++o++++++++++oo                                                       +oo++++++++++o                                                 | \e[0m "
echo -e " \n\e[1;36m |                  +o+++++++++++o                                                    o++o++++++++++++o                                                | \e[0m "
echo -e " \n\e[1;36m |                   o+o++++++++++o                                                 +++o++++++++++++++o                                                | \e[0m "
echo -e " \n\e[1;36m |                     oo+o+++++++oo'       '+ooo,                                ,++o++++++++++++++++++                                               | \e[0m "
echo -e " \n\e[1;36m |                       ,o+o++++++oo     ++++ooo++o                             oo++++++++++++++++++++o                                               | \e[0m "
echo -e " \n\e[1;36m |                           ,+o+oo+oo; 'o++      '++                          o+o++++++++++++++++++++++                                               | \e[0m "
echo -e " \n\e[1;36m |                                 '+' +oo          o+                       .+++++++++++++++++++++++++                                                | \e[0m "
echo -e " \n\e[1;36m |                                    .o+            oo   +ooo++oo        ' oo++++++++++++++++++++++++o                                                | \e[0m "
echo -e " \n\e[1;36m |                                    +o              ++o++o;  ,o+o'     '.++++++++++++++++++++++++o+o                                                 | \e[0m "
echo -e " \n\e[1;36m |                                   oo              '+++'        ooo    ooo++++++++++++++++++++++++;                                                  | \e[0m "
echo -e " \n\e[1;36m |                                   +'               +o           ,++ ;++++++++++++o++++++++++++o.                                                    | \e[0m "
echo -e " \n\e[1;36m |                                  'o               +o             +o  +++o+oo++oooooo++ooooo+                                                        | \e[0m "
echo -e " \n\e[1;36m |                                  oo              oo               oo o+oo;                                                                          | \e[0m "
echo -e " \n\e[1;36m |                                  oo    oo       ,+                '+                                                                                | \e[0m "
echo -e " \n\e[1;36m |                                  oo   ++oo      oo                 ++   o+ooo                                                                       | \e[0m "
echo -e " \n\e[1;36m |                                  oo   o+oo      +.                 oo  oo';++++                                                                     | \e[0m "
echo -e " \n\e[1;36m |                                  .+   'oo       +     oo'          '+ +o;;;;;+oo                                                                    | \e[0m "
echo -e " \n\e[1;36m |                                   o'            o    oo++          .+o++o+o;;;;++                                                                   | \e[0m "
echo -e " \n\e[1;36m |                                   o+            +    oooo          +++';,'+o;;;;+o                                                                  | \e[0m "
echo -e " \n\e[1;36m |                                    +o           ++    oo.          oo '' ' +o;;;;+++oo.                                                       oooo  | \e[0m "
echo -e " \n\e[1;36m |                                    .++          oo                 +,     ' +o;;;;+'oo++oo'                                                 +o+o+++ | \e[0m "
echo -e " \n\e[1;36m |                                     ++o        oo++               o+ '     ' o+;;;o+ ' 'oo++o,                                             oo+++++++| \e[0m "
echo -e " \n\e[1;36m |                                      ,++o+.+oo++.o+              'o.''   ' ''oo;;;;++   '  'o++o,                                         o+++++++++| \e[0m "
echo -e " \n\e[1;36m |                                     ;oo+oooooo'  'o+            'o+'''     '  ++;;;++   ''''' ;o+oo'                                     oo+++++++++| \e[0m "
echo -e " \n\e[1;36m |                                   o++o' ' '   '' ' o+'         oo+          ' +o;;;;+'''   '' '  +o+o+                                  o++++++++++o| \e[0m "
echo -e " \n\e[1;36m |                                 o+o'   ''' ''' '' ' o+o.    ,o+o '''           ++;;;oo''        ''  o+oo                               ,++++++++++oo| \e[0m "
echo -e " \n\e[1;36m |                               o+o,  ''             ''.o++++ooo.'               o+;;;;+ '           '  'o+o'                            oo++++++++++ | \e[0m "
echo -e " \n\e[1;36m |                             ;++.'   ''           ' '' '  ''  '  '             ' +;;;;o+              '' 'o+o'                         oo++++++++++o | \e[0m "
echo -e " \n\e[1;36m |                            oo+ ''                        '''                  ''oo;;;oo''                ' o+o'                      o+++++++++++o  | \e[0m "
echo -e " \n\e[1;36m |                          '+o  ' '                                              '+o;;;'+ '                ''' o+o                    .++++++++++o+   | \e[0m "
echo -e " \n\e[1;36m |                         o++ '  '                                                 o.;;;+ '                     '++'                  ++++++++++oo    | \e[0m "
echo -e " \n\e[1;36m |                        oo ''                                                     o+;;;++'                     ' o+o                o+++++++++o+     | \e[0m "
echo -e " \n\e[1;36m |                      ;+o                                                       ''oo;;;oo'                     '  '+o              .+++++++++++      | \e[0m "
echo -e " \n\e[1;36m |                     o++' '                                                    ''';+;;;o+'                       '  +o             ++++++++++o       | \e[0m "
echo -e " \n\e[1;36m |                    oo.' '                                                     '   +;;;+o                         '  oo           oo++++++++;        | \e[0m "
echo -e " \n\e[1;36m |                   oo.                                                             +.;;;o                         '   +o         .o+++++++o          | \e[0m "
echo -e " \n\e[1;36m |                  o+''                                                           ' +';;.+ '                          ' ++        +++++++o            | \e[0m "
echo -e " \n\e[1;36m |                 ++,  '                                                          ' o+;;;+                            '''o       oo+++o++             | \e[0m "
echo -e " \n\e[1;36m |                .o''                                                              'oo;;;o '                           ''oo     ,+++o+o               | \e[0m "
echo -e " \n\e[1;36m |                oo' '                                                             'oo;;;+'                             ' o;    ooooo'                | \e[0m "
echo -e " \n\e[1;36m |               o+                                                                 'oo;;;+'                               oo   o+o+'                  | \e[0m "
echo -e " \n\e[1;36m |              .+    '                                                  ''     '    o+;;;+                               ' o; o+++                    | \e[0m "
echo -e " \n\e[1;36m |       'oooo+oo++  '' '                                               '  '''    '''o+;;;o '''                          '''oo ,+                      | \e[0m "
echo -e " \n\e[1;36m |     .++o++++++o+ooo' '                                              ''o+o.  +oo'  +';;.o '''                           '' o                         | \e[0m "
echo -e " \n\e[1;36m |    o+o++++++++++++o+o+  ''                                            '.oooo++ '  o.;;'+                                 'oo                        | \e[0m "
echo -e " \n\e[1;36m |   +++++++o++oo++++++oo+'''                                             ''oo   '' .+;;;oo                                  oo                        | \e[0m "
echo -e " \n\e[1;36m |  ++++ooooo+ooo+o++++++ooo ''                                            'o+ '  ''o+;;;oo                                 ' +                        | \e[0m "
echo -e " \n\e[1;36m | o++++o         o+o++++++++. ''                                         ' o '   ' o+;;;o,'                                  o.                       | \e[0m "
echo -e " \n\e[1;36m |'++++o+          ,o+++++++o+, '                                          o+'     'o;;;++ '                                ''o+                       | \e[0m "
echo -e " \n\e[1;36m |o++++++o          o++++++++o+ '                                         '+o'     oo;;;oo'                                  'oo                       | \e[0m "
echo -e " \n\e[1;36m |++++++++o.        oo++++++++++                                         ',+ '   ' +;;;;+ '                                   oo                       | \e[0m "
echo -e " \n\e[1;36m |o+++++++++o,      ++++++++++++o                                        'oo' ''' oo;;;oo' '                                 ''+                       | \e[0m "
echo -e " \n\e[1;36m |++++++++++o++oo+o++++++++++++++                                        '+ '' ''o+;;;++                                      ;+                       | \e[0m "
echo -e " \n\e[1;36m |++++++++++++++ooo+++++++++++++oo'                                    ''oo  ' 'oo';;;+o                                    ' .o                       | \e[0m "
echo -e " \n\e[1;36m |o+++++++++++++++++++++++++++++o+                                     ';+   ' oo+;;;++'                                    '';+                       | \e[0m "
echo -e " \n\e[1;36m |++++++++++++++++++++++++++++++++                                  ''' +o''' o+;;;;o+ '                                    ' '+                       | \e[0m "
echo -e " \n\e[1;36m |++++++++++++++++++++++++++++++++ '                                 ''oo  .ooo;;;;oo ' '                                   ' oo                       | \e[0m "
echo -e " \n\e[1;36m |oo+++++++++++++++++++++++++++++o,                                 ''.o+o+oo;;;;;o+                                         'oo                       | \e[0m "
echo -e " \n\e[1;36m |,+++++++++++++++++++++++++++++++,                                '' +ooo';;;;;o+o '                                       ''o+                       | \e[0m "
echo -e " \n\e[1;36m | oo+++++++++++++++++++++++++++++ '                              '' o+;;;;;;;++++'                                           +'                       | \e[0m "
echo -e " \n\e[1;36m |  +o++++++++++++++++++++++++++++                                ''o+;;;;;+o++o                                            '.+                        | \e[0m "
echo -e " \n\e[1;36m |  .oo+++++++++++++++++++++++++o+                               ''o+++o+++oo. '                                           ''oo                        | \e[0m "
echo -e " \n\e[1;36m |   ,oo++++++++++++++++++++++++++                                o+,o++',   ' '                                           ' +                         | \e[0m "
echo -e " \n\e[1;36m |     ooo+++++++++++++++++++++oo                              ''oo,  oo'' '' '        ' '''             '     '         '''oo                         | \e[0m "
echo -e " \n\e[1;36m |      +o+o++++++++++++++++++o+''                            ''o+,   ,o    oo++''      '              '  ''  ;o'         'o+                          | \e[0m "
echo -e " \n\e[1;36m |        ++oo+++++++++++++++o+,' '                          ''oo'     +o ' ,'ooo''     ',o;  ''''''''''   'o+oo         '.o.                          | \e[0m "
echo -e " \n\e[1;36m |          .o++++o++++++++++o                           '  ' o+        +'''  ',o+''      oo+ooo+';;'+oo++++o+            +o                           | \e[0m "
echo -e " \n\e[1;36m |            + +o++++o+++oo ' '                         ''''+o         o+''   '++ '     ''+ ;ooooooooooo.   +.'       '',+                            | \e[0m "
echo -e " \n\e[1;36m |            ++'''       ''                           ''' ooo           o+     'o+''''    +;          +,' ''oo          o+                            | \e[0m "
echo -e " \n\e[1;36m |            o+''                                        oo.            ++ '   ' +;'''   'oo          oo'  'oo '      '''o                            | \e[0m "
echo -e " \n\e[1;36m |             +.     '  '                           '' ooo               oo      oo '   '' o          .o    '+''        'o                            | \e[0m "
echo -e " \n\e[1;36m |             o+                                   ' ++o,                 +,'   ' o''    ' o+          +; '''+           +                            | \e[0m "
echo -e " \n\e[1;36m |              o+ '' '                        ' '  ++++                   o+ '   'oo    ' 'oo          oo '  + '        'o+                           | \e[0m "
echo -e " \n\e[1;36m |               oo. '                         '  oo+o                      ++   '''o'     ''+          '+  ''o+'        'oo                           | \e[0m "
echo -e " \n\e[1;36m |                ooo ' ' '   '     '    '' '  o+oo;                        oo    ' +        +.         ,+ ' 'oo'        '.o                           | \e[0m "
echo -e " \n\e[1;36m |                  o+o+  ' '''''''''''    ;oo+oo                         '++;'''   +' ''''' oo         oo ' ',o ''''''''  +                           | \e[0m "
echo -e " \n\e[1;36m |                    ooooo+'        .+oo+++o'                           .+o ''''  +o,      '++'''''   oo  ''''+.         '+'                          | \e[0m "
echo -e " \n\e[1;36m |                      'oo+++oo+ooo++ooo,                               +o  '' ' o+o       ''+ ''''''oo   ''ooo,          oo                          | \e[0m "
echo -e " \n\e[1;36m |                             '''                             '''''''''oo''' '';+o  ''       o '''''++ '  'oo' ''''      'oo''                        | \e[0m "
echo -e " \n\e[1;36m |                                                        ''''''''''''''o+'' ' ,+o''          o.'''''oo'' 'o+ '          ''++'''''''                   | \e[0m "
echo -e " \n\e[1;36m |                                                     '''''''''''''''''oo''   +o           ' +,'''' +  ' .+ '           ''+o''''''''''                | \e[0m "
echo -e " \n\e[1;36m |                                                   ''''''''''''''''''''oo;   +   '        ' + '''' +  ''+o             ''oo''''''''''''              | \e[0m "
echo -e " \n\e[1;36m |                                                  ''''''''''''''''''''' o+++o+'' ''     '' ,o '''''o+o+o+ '      '''  '' ++'''''''''''''             | \e[0m "
echo -e " \n\e[1;36m |                                                   '''''''''''''''''''''''   o+o   '  ''  ooo''''''''oooo '''''  ''''  ++o'''''''''''''              | \e[0m "
echo -e " \n\e[1;36m |                                                     ''''''''''''''''''''''''';o+++oooo+oo++''''''''''''o+ooo+++oooo++o+o''''''''''''                | \e[0m "
echo -e " \n\e[1;36m |                                                       ''''''''''''''''''''''''' ';+ooo;. ''''''''''''''' +ooooooooo;. ''''''''''''                  | \e[0m "
echo -e " \n\e[1;36m |                                                            ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''                       | \e[0m "
echo -e " \n\e[1;36m |                                                                    ''''''''''''''''''''''''''''''''''''''''''''''''''                               | \e[0m "
echo -e " \n\e[1;36m |                                                                                   '''''''''''''''''''                                               | \e[0m "
echo -e " \n\e[1;36m |-----------------------------------------------------------------------------------------------------------------------------------------------------| \e[0m "



echo -e " \n\e[1;31m ---------------------------------------------------------- \e[0m "
echo -e " \n\e[1;31m                  MySQL 5.6 Install Script                  \e[0m "
echo -e " \n\e[1;31m                CopyRight © ANE WLL -- 2018                 \e[0m "
echo -e " \n\e[1;31m ---------------------------------------------------------- \e[0m "
echo -e " \n\e[1;31m      Please input mysql basic information specifics:       \e[0m "
echo -e " \n\e[1;31m ********************************************************** \e[0m "

read -p " 0) Please enter a mysql software location, default /tmp/mysql : " soft
        [ -z $soft ] && soft="/tmp/mysql"
read -p " 1) Please enter mysql version, default 5641 : " version
        [ -z $version ] && version="5641"
read -p " 2) Please enter mysql role(master or slave), if master input 0, if slave input 1, default 0 : " role
        [ -z $role ] && role=0
read -p " 3) Please enter host memory size 16/32/64/128(G), default 128 : " mem
        [ -z $mem ] && mem=128
        dbmem=$[$mem*7/10]
        unit='G'
        dbbuffer=$dbmem$unit
read -p " 4) Please enter mysql server id, default generate a random number as server id : " serverid
        [ -z $serverid ] && serverid=$(($RANDOM%2000+8000))
read -p " 5) Please enter mysql port, default 3306 : " port
        [ -z $port ] && port=3306
read -p " 6) Please enter mysql installation directory softdir, default /mnt : " softdir
        [ -z $softdir ] && softdir="/mnt"
        basepath=$softdir/mysql$version
read -p " 7) Please enter mysql datafile and logfile directory datadir, default /data : " datadir
        [ -z $datadir ] && datadir="/data"
        datapath=$datadir/ane$port
read -p " 8) Please enter mysql binlog directory binlogdir, default /data : " binlogdir
        [ -z $binlogdir ] && binlogdir="/data"
binlogpath=$binlogdir/binlog$port



echo -e " \n\e[1;31m --------------------------------------------------------------- \e[0m"
echo -e " \n\e[1;31m                  MySQL 5.6 Install Information                  \e[0m"
echo -e " \n\e[1;31m                   CopyRight © ANE WLL -- 2018                   \e[0m"
echo -e " \n\e[1;31m --------------------------------------------------------------- \e[0m"
echo -e " \n\e[1;31m   Please confirm you specific mysql installation information:   \e[0m"
echo -e " \n\e[1;31m *************************************************************** \e[0m"
echo -e " \n\e[1;33m 1) MySQL INSTALLATION DIRECTORY : ${basepath} \e[0m"
echo -e " \n\e[1;33m 2) MySQL DATA DIRECTORY : ${datapath} \e[0m"
echo -e " \n\e[1;33m 3) MySQL BINGLOG DIRECTORY : ${binlogpath} \e[0m"
echo -e " \n\e[1;33m 4) MySQL PORT : ${port} \e[0m"
echo -e " \n\e[1;33m 5) MySQL SERVERID : ${serverid} \e[0m"
echo ""

read -p " Is the above information correct? [y/n] : " ans
        [ -z $ans  ] && ans="n"

if [ "$ans" == "y" ]; then
        echo -e " \n\e[1;32m The script is running please wait... ... OK! \e[0m "
else
        exit
fi



echo -e " \n\e[1;35m ------------------------------------------------------------------ \e[0m "
echo -e " \n\e[1;35m Check the execute uers if is root \e[0m "
echo -e " \n\e[1;35m ------------------------------------------------------------------ \e[0m "
if [ $USER != "root" ] ; then
        echo -e " \n\e[1;31m The execute user must be root, but now your current user is $USER, please change to root! \e[0m "
        exit
else
        echo -e " \n\e[1;32m The current user is root... ... OK! \e[0m "
fi



echo -e " \n\e[1;35m ------------------------------------------------------------------ \e[0m "
echo -e " \n\e[1;35m Add IP and hostname to hsots file \e[0m "
echo -e " \n\e[1;35m ------------------------------------------------------------------ \e[0m "
hostname=`sed -n '/HOSTNAME/p' /etc/sysconfig/network|sed -s "s/=/ /g"|gawk '{print $2}'`
ip=`/sbin/ifconfig -a|grep inet|grep -v 127.0.0.1|grep -v inet6|awk '{print $2}'|tr -d "addr:"`

if [[ -z `grep $ip /etc/hosts` ]] ; then
        echo $ip $hostname >> /etc/hosts
        echo -e " \n\e[1;32m The /etc/hosts set successfully... ... OK! \e[0m "
else
        echo -e " \n\e[1;33m The /etc/hosts aready set! \e[0m "
fi



echo -e " \n\e[1;35m ------------------------------------------------------------------ \e[0m "
echo -e " \n\e[1;35m Install rpm packages and check the need packages if are installed  \e[0m "
echo -e " \n\e[1;35m ------------------------------------------------------------------ \e[0m "
echo ""
for package in libaio libaio-devel ftp telnet
        do
                rpm -q $package 2> /dev/null
                if [ $? != 0 ] ; then
                        yum -y install $package
                        echo -e " \n\e[1;32m The rpm $package install successfully... ... OK! \e[0m "
                else
                        echo -e " \n\e[1;33m The rpm $package already installed! \e[0m "
                fi
done



echo -e " \n\e[1;35m ------------------------------------------------------------------ \e[0m "
echo -e " \n\e[1;35m The follow package have been installed \e[0m "
echo -e " \n\e[1;35m ------------------------------------------------------------------ \e[0m "
echo ""
for package in libaio libaio-devel ftp telnet
        do
                rpm -qa|grep $package
done



echo -e " \n\e[1;35m ------------------------------------------------------------------ \e[0m "
echo -e " \n\e[1;35m Download mysql server soft to /tmp directory \e[0m "
echo -e " \n\e[1;35m ------------------------------------------------------------------ \e[0m "
cd /tmp
mysqlserver=/tmp/mysql-5.6.41-linux-glibc2.12-x86_64.tar.gz
if [ ! -f $mysqlserver ] ; then
	echo -e " \n\e[1;33m Being download mysql server soft... \e[0m "
	echo ""
	wget --user=ftpuser --password=ftpuser 172.17.99.62:/mysql/db/mysql-5.6.41-linux-glibc2.12-x86_64.tar.gz
	echo -e " \n\e[1;32m Download mysql server soft successfully... ... OK! \e[0m "
else
	echo -e " \n\e[1;33m The mysql server soft is already exist! \e[0m "
fi



echo -e " \n\e[1;35m ------------------------------------------------------------------ \e[0m "
echo -e " \n\e[1;35m Download Percona XtraBackup and PT and dependency rpm package to /tmp directory \e[0m "
echo -e " \n\e[1;35m ------------------------------------------------------------------ \e[0m "
cd /tmp
xtrabackup=/tmp/percona-xtrabackup-24-2.4.12-1.el6.x86_64.rpm
toolkit=/tmp/percona-toolkit-3.0.12-1.el6.x86_64.rpm
libevfile=/tmp/libev4-4.15-7.1.x86_64.rpm
if [ ! -f $xtrabackup ] ; then
	echo -e " \n\e[1;33m Being download Percona XtraBackup package... \e[0m "
	echo ""
	wget --user=ftpuser --password=ftpuser 172.17.99.62:/mysql/backup/percona-xtrabackup-24-2.4.12-1.el6.x86_64.rpm
	echo -e " \n\e[1;32m Download Percona XtraBackup package successfully... ... OK! \e[0m "
else
	echo -e " \n\e[1;33m Percona XtraBackup package is already exist! \e[0m "
fi

if [ ! -f $toolkit ] ; then
        echo -e " \n\e[1;33m Being download Percona PT package... \e[0m "
        echo ""
        wget --user=ftpuser --password=ftpuser 172.17.99.62:/mysql/backup/percona-toolkit-3.0.12-1.el6.x86_64.rpm
        echo -e " \n\e[1;32m Download Percona PT package successfully... ... OK! \e[0m "
else
        echo -e " \n\e[1;33m Percona PT package is already exist! \e[0m "
fi

if [ ! -f $libevfile ] ; then
        echo -e " \n\e[1;33m Being download Percona dependency package... \e[0m "
        echo ""
        wget --user=ftpuser --password=ftpuser 172.17.99.62:/mysql/backup/libev4-4.15-7.1.x86_64.rpm
        echo -e " \n\e[1;32m Download Percona dependency package successfully... ... OK! \e[0m "
else
        echo -e " \n\e[1;33m Percona dependency package is already exist! \e[0m "
fi



echo -e " \n\e[1;35m ------------------------------------------------------------------ \e[0m "
echo -e " \n\e[1;35m Install Percona XtraBackup and PT and dependency rpm package \e[0m "
echo -e " \n\e[1;35m ------------------------------------------------------------------ \e[0m "
cd /tmp
echo -e " \n\e[1;33m Being install Percona XtraBackup and PT and dependency rpm package... \e[0m "
echo ""
yum -y localinstall percona-xtrabackup-24-2.4.12-1.el6.x86_64.rpm
yum -y localinstall libev4-4.15-7.1.x86_64.rpm
yum -y localinstall percona-toolkit-3.0.12-1.el6.x86_64.rpm
echo -e " \n\e[1;32m Install Percona XtraBackup and PT and dependency rpm package successfully... ... OK! \e[0m "



echo -e " \n\e[1;35m ------------------------------------------------------------------ \e[0m "
echo -e " \n\e[1;35m Create mysql install directory \e[0m "
echo -e " \n\e[1;35m ------------------------------------------------------------------ \e[0m "
if [ ! -d $basepath ] ; then
        mkdir -p $basepath
        echo -e " \n\e[1;32m The directory '$basepath' create successfully... ... OK! \e[0m "
else
        echo -e " \n\e[1;33m The directory '$basepath' is already exist! \e[0m "
fi

if [ ! -d $basepath/init.d ] ; then
        mkdir $basepath/init.d
        echo -e " \n\e[1;32m The directory '$basepath/init.d' create successfully... ... OK! \e[0m "
else
        echo -e " \n\e[1;33m The directory '$basepath/init.d' is already exist! \e[0m "
fi

if [ ! -d $basepath/etc ] ; then
        mkdir $basepath/etc
        echo -e " \n\e[1;32m The directory '$basepath/etc' create successfully... ... OK! \e[0m "
else
        echo -e " \n\e[1;33m The directory '$basepath/etc' is already exist! \e[0m "
fi



echo -e " \n\e[1;35m ------------------------------------------------------------------ \e[0m "
echo -e " \n\e[1;35m Create mysql data directory \e[0m "
echo -e " \n\e[1;35m ------------------------------------------------------------------ \e[0m "
if [ ! -d $datapath ] ; then
        mkdir -p $datapath
        echo -e " \n\e[1;32m The mysql data directory '$datapath' create successfully... ... OK! \e[0m "
else
        echo -e " \n\e[1;33m The mysql data directory '$datapath' is already exist! \e[0m "
fi



echo -e " \n\e[1;35m ------------------------------------------------------------------ \e[0m "
echo -e " \n\e[1;35m Create mysql binlog directory \e[0m "
echo -e " \n\e[1;35m ------------------------------------------------------------------ \e[0m "
if [ ! -d $binlogpath ] ; then
        mkdir -p $binlogpath
        echo -e " \n\e[1;32m The mysql binlog directory '$binlogpath' create successfully... ... OK! \e[0m "
else
        echo -e " \n\e[1;33m The mysql binlog directory '$binlogpath' is already exist! \e[0m "
fi



echo -e " \n\e[1;35m ------------------------------------------------------------------ \e[0m "
echo -e " \n\e[1;35m Unzip mysql server soft to /tmp directory \e[0m "
echo -e " \n\e[1;35m ------------------------------------------------------------------ \e[0m "
cd /tmp
tar -zxf mysql-5.6.41-linux-glibc2.12-x86_64.tar.gz 
if [ ! -d $soft ] ; then
	mv mysql-5.6.41-linux-glibc2.12-x86_64 mysql
else
	mv $soft /tmp/mysql_`date +"%Y%m%d_%H%M%S"`
	mv mysql-5.6.41-linux-glibc2.12-x86_64 mysql
fi
echo -e " \n\e[1;32m Unzip mysql server soft successfully... ... OK! \e[0m "



echo -e " \n\e[1;35m ------------------------------------------------------------------ \e[0m "
echo -e " \n\e[1;35m Copy mysql soft to basepath \e[0m "
echo -e " \n\e[1;35m ------------------------------------------------------------------ \e[0m "
if [ ! -d $basepath/bin ] ; then
        cp -a $soft/* $basepath/
        echo -e " \n\e[1;32m The soft copy complete... ... OK! \e[0m "
else
        echo -e " \n\e[1;33m The soft is already exist! \e[0m "

fi



echo -e " \n\e[1;35m ------------------------------------------------------------------ \e[0m "
echo -e " \n\e[1;35m Set OS static kernel parameters \e[0m "
echo -e " \n\e[1;35m ------------------------------------------------------------------ \e[0m "
SYSCTL=/etc/sysctl.conf
if [ -z "$(grep "swappiness" $SYSCTL)" ] ; then
        cat <<EOF >>$SYSCTL
vm.swappiness = 5
vm.dirty_ratio = 5
vm.dirty_background_ratio = 10
EOF
        echo -e " \n\e[1;32m OS static kernel parameters updated successfully... ... OK! \e[0m "
else
        echo -e " \n\e[1;33m OS static kernel parameters already existed! \e[0m "
fi  
echo ""
sysctl -p



echo -e " \n\e[1;35m ------------------------------------------------------------------ \e[0m "
echo -e " \n\e[1;35m Set mysql resource limits \e[0m "
echo -e " \n\e[1;35m ------------------------------------------------------------------ \e[0m "
LIMITS='/etc/security/limits.conf'
if [ -z "$(grep "mysql" $LIMITS)" ] ; then
        cat <<EOF >> $LIMITS
mysql soft nofile 65535
mysql hard nofile 65535
mysql soft nproc  65535
mysql hard nproc  65535
EOF
        echo -e " \n\e[1;32m The $LIMITS updated successfully ... ... OK! \e[0m "
else
        echo -e " \n\e[1;33m The $LIMITS  parameters is already existed! \e[0m "
fi



echo -e " \n\e[1;35m ------------------------------------------------------------------ \e[0m "
echo -e " \n\e[1;35m Add mysql group and user \e[0m "
echo -e " \n\e[1;35m ------------------------------------------------------------------ \e[0m "
if [[ `grep "mysql" /etc/group` != "" ]] ; then
        echo -e " \n\e[1;33m The user group mysql is already existed! \e[0m "
else 
        groupadd -g 1000 mysql
        echo -e " \n\e[1;32m The user group mysql create successfully... ... OK! \e[0m "
fi
        
if [[ `grep "mysql" /etc/passwd` != "" ]] ; then
        echo -e " \n\e[1;33m The user mysql is already existed! \e[0m "
else
        useradd -u 1000 -g mysql mysql
        echo mysql|passwd mysql --stdin
        echo -e " \n\e[1;32m The user mysql create successfully... ... OK! \e[0m "
fi



echo -e " \n\e[1;35m ------------------------------------------------------------------ \e[0m "
echo -e " \n\e[1;35m Add mysql startup parameter file \e[0m "
echo -e " \n\e[1;35m ------------------------------------------------------------------ \e[0m "

params=$basepath/etc/my_$port.cnf 
  
if [ ! -f $params ] ; then
        cat <<EOF >>$params
[client]
port = $port
socket = $datapath/mysqld.sock

[mysqld]
read_only = $role # SLAVE机器开启这个选项
server_id = $serverid # 每组里面的serverid必须不同
port = $port
log_bin_trust_function_creators = 1
sql_mode = NO_ENGINE_SUBSTITUTION,STRICT_TRANS_TABLES

# GENERAL #
user = mysql
default_storage_engine = InnoDB
socket = $datapath/mysqld.sock
pid_file = $datapath/mysql.pid
datadir = $datapath

# LOGGING #
#general_log_file = $datapath/mysql_general.log
#log_queries_not_using_indexes = 1
log_error = $datapath/mysql_error.log
slow_query_log_file = $datapath/mysql_slow.log
log_output = file
slow_query_log = 1
long_query_time = 1

# BINARY LOGGING #
#binlog_ignore_db = mysql,information_schema
log_bin = $binlogpath/mysql_bin
relay_log = $binlogpath/mysql_relay_bin
expire_logs_days = 7
log_slave_updates = 1
binlog_format = ROW
binlog_cache_size = 2M

# MyISAM #
key_buffer_size = 32M
join_buffer_size = 16M
sort_buffer_size = 32M
read_rnd_buffer_size = 32M

# SAFETY #
max_allowed_packet = 16M
max_connect_errors = 1000000
wait_timeout = 600
interactive_timeout = 600
lower_case_table_names = 1

# CACHES AND LIMITS #
tmp_table_size = 32M
max_heap_table_size = 32M
query_cache_type = 0
query_cache_size = 0
max_connections = 5000
open_files_limit = 65535
table_definition_cache = 4096
table_open_cache = 3000

# INNODB #
#innodb_flush_method = O_DIRECT
innodb_log_files_in_group = 3
innodb_log_file_size = 1G
innodb_log_buffer_size = 128M # 如果Innodb_log_waits不为0可以适当增加
innodb_file_per_table = 1
innodb_flush_log_at_trx_commit = 1 # 1安全级别最高性能最低SSD除外 0性能最高安全最低不建议 2保证了性能和安全
sync_binlog = 1                    # 0表示操作系统级别刷盘 1是最安全的 N表示多少个commit后将二进制日志缓存进行刷盘
innodb_buffer_pool_size = $dbbuffer # 设置当前内存的70%
innodb_read_io_threads = 4 # 加大可增加读性能
innodb_write_io_threads = 4 # 加大可增加写性能
innodb_io_capacity = 200 # 根据磁盘IOPS调整SSD可调高
innodb_buffer_pool_instances = 8
innodb_thread_concurrency = 0 # 如果用户线程少于64个建议设置为0 如果超过64根据线程数具体来设置
#innodb_additional_mem_pool_size = 32M # 该参数在后期版本中可能会取消
innodb_strict_mode = 1
innodb_purge_threads = 8

# CHARACTER #
character_set_server = utf8
collation_server = utf8_general_ci
explicit_defaults_for_timestamp = true

# master and slave 
#slave_skip_errors = all
innodb_lock_wait_timeout = 60
innodb_spin_wait_delay = 96
innodb_thread_concurrency = 64
innodb_max_dirty_pages_pct = 85
innodb_support_xa = 0

# SSD #
#innodb_io_capacity = 2000
#innodb_flush_neighbors = 0
#innodb_page_size = 8K
#innodb_log_block_size = 4096
innodb_file_format = Barracuda
innodb_file_format_max = Barracuda
innodb_strict_mode = 1
innodb_purge_threads = 8
innodb_purge_batch_size = 32
innodb_old_blocks_pct = 37
innodb_old_blocks_time = 1000
innodb_change_buffering = all
innodb_stats_on_metadata = off
transaction_isolation = READ-COMMITTED
EOF
        echo -e " \n\e[1;32m The $params parameter file updated successfully... ... OK! \e[0m "
else
        echo -e " \n\e[1;33m The $params parameter file is already existed! \e[0m "
fi

chown  -R  mysql:mysql $basepath
chown  -R  mysql:mysql $datapath
chown  -R  mysql:mysql $binlogpath


echo -e " \n\e[1;35m ------------------------------------------------------------------ \e[0m "
echo -e " \n\e[1;35m Create database instance startup script \e[0m "
echo -e " \n\e[1;35m ------------------------------------------------------------------ \e[0m "
STARTFILE="$basepath/init.d/start$port.sh"
if [ ! -f $STARTFILE ] ; then
        touch $STARTFILE
        echo "#!/bin/bash" > $STARTFILE
        echo "numactl --interleave=all $basepath/bin/mysqld_safe --defaults-file=$params &" >> $STARTFILE
        echo -e " \n\e[1;32m The database instance startup script create successfully.... ... OK! \e[0m "
else 
        echo -e " \n\e[1;33m The database instance startup script is already exist! \e[0m "
fi

chown mysql:mysql $STARTFILE
chmod +x $STARTFILE



echo -e " \n\e[1;35m ------------------------------------------------------------------ \e[0m "
echo -e " \n\e[1;35m Startup database instance \e[0m "
echo -e " \n\e[1;35m ------------------------------------------------------------------ \e[0m "
echo -e " \n\e[1;33m Begin create database... \e[0m "
echo ""
DATACOUNT=`ls $datapath | wc -l`
if [[ $DATACOUNT -eq 0 ]] ; then
        $basepath/scripts/mysql_install_db --user=mysql --basedir=$basepath --datadir=$datapath --defaults-file=$params &
        sleep 20
        sleep 20
        sleep 20
#       cp $basepath/bin/mysqld_safe $basepath/bin/mysqld_safe_`date +"%Y%m%d_%H%M%S".bak`
#       sed -i "s#/usr/local/Percona-Server-5.6.35-rel81.0-Linux.x86_64.ssl101#$basepath#g" $basepath/bin/mysqld_safe
        $basepath/bin/mysqld_safe --defaults-file=$params &
        sleep 60
        echo -e " \n\e[1;32m The database create and start successfully.... ... OK! \e[0m "
else
        echo -e " \n\e[1;33m The database instance not found! \e[0m "
fi



echo -e " \n\e[1;35m ------------------------------------------------------------------ \e[0m "
echo -e " \n\e[1;35m Configure database \e[0m "
echo -e " \n\e[1;35m ------------------------------------------------------------------ \e[0m "
echo ""
sleep 60
MYSQL=$basepath/bin/mysql
MYSQLADMIN=$basepath/bin/mysqladmin
CURRENTPASSWORD='AnE56.com'
HOST=127.0.0.1
$MYSQLADMIN -S $datapath/mysqld.sock password $CURRENTPASSWORD
$MYSQL -h$HOST -P$port -u$USER -p$CURRENTPASSWORD -e "delete from mysql.user where user <> 'root' or host <> 'localhost';"
$MYSQL -h$HOST -P$port -u$USER -p$CURRENTPASSWORD -e "drop database test;"
sleep 10
echo -e " \n\e[1;32m The database configure successfully.... ... OK! \e[0m "



echo -e " \n\e[1;35m ------------------------------------------------------------------ \e[0m "
echo -e " \n\e[1;35m Create database instance stop script \e[0m "
echo -e " \n\e[1;35m ------------------------------------------------------------------ \e[0m "
STOPFILE="$basepath/init.d/stop$port.sh"
if [ ! -f $STOPFILE ]; then
        touch $STOPFILE
        echo "#!/bin/bash" > $STOPFILE
        echo "$basepath/bin/mysqladmin -u$USER -p$CURRENTPASSWORD -P$port --socket=$datapath/mysqld.sock shutdown" >> $STOPFILE
        echo -e " \n\e[1;32m The database instance stop script create successfully.... ... OK! \e[0m "
else
        echo -e " \n\e[1;33m The database instance stop script is already exist! \e[0m "
fi

chown mysql:mysql $STOPFILE
chmod +x $STOPFILE
