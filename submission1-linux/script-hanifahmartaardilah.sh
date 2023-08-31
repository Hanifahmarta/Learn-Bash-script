#!/bin/bash

# Perintah 1

echo -e "Output dari perintah 1:"

# Perintah untuk ketentuan 1 dalam waktu 3 detik
# Menampilkan ukuran memory pada sistem dalam suatu megabytes

free -m &


# Tunggu selama 3 detik
sleep 3

echo -e "\n"

# Perintah 2

echo -e "Output dari perintah 2:"

# Perintah untuk ketentuan 2 dalam waktu 3 detik
# Menampilkan penggunaan ruang disk pada filesystem dalam satuan gigabytes.
filesize=$(df -h | awk '{ if($1 != "Filesystem") print $1, $3/1024 "GB used,",$4/1024 "GB free" }')
echo "$filesize"&

#Tunggu selama 3 detik
sleep 3

echo -e "\n"
# Perintah 3
echo -e "Output dari perintah 3:"

# Perintah untuk ketentuan  3 dalam waktu 1 menit
# Menampilkan kolom Filesystem dan Use% saja

filesize=$(df -h | grep -v "tmpfs" | awk '{print $1, $5}')
echo "$filesize"&

#Tunggu selama 1 menit
sleep 1m