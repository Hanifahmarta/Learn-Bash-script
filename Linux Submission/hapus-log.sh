#!/bin/bash

while true
do
  # Menampilkan informasi penggunaan disk dari semua berkas journalctl
  echo "Informasi penggunaan disk sebelum penghapusan log:"
  journalctl --disk-usage

  # Menghapus journalctl log hingga ruang disk yang digunakan untuk log berkisar 10 MB
  journalctl --vacuum-size=10M

  # Menampilkan informasi penggunaan disk dari semua berkas journalctl
  echo -e "\nInformasi penggunaan disk setelah penghapusan log:"
  journalctl --disk-usage

  # Jeda selama 1 menit sebelum mengulang kembali perintah
  sleep 60
done
