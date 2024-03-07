ls -f -1 > f1ls.txt
./os_p1_100531523_100495775_100531510/myls.o > f1myls.txt
diff f1ls.txt f1myls.txt
rm f1ls.txt f1myls.txt
