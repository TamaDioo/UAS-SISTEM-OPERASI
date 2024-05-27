#!/bin/bash

# Beberapa fungsi untuk fitur tertentu
show_files() {
    echo "Daftar File dalam Direktori: $1"
    ls -l $1
}

count_words() {
    echo "Jumlah Kata dalam File: $1"
    wc -w $1 | awk '{print $1}'
}

show_date() {
	current_date=$(date +"%Y-%m-%d")
	current_time=$(date +"%H:%M:%S")
	echo "Tanggal: $current_date"
	echo "Waktu: $current_time"
}

show_dir() {
	pwd
}

count_chars() {
    echo "Jumlah character dalam File: $1"
    wc -m $1 | awk '{print $1}'
}

show_info() {
    echo "Hostname: $(hostname)"
    echo "Versi Kernel: $(uname -r)"
    echo "Distributor: $(lsb_release -i -s)"
    echo "Versi Distribusi: $(lsb_release -r -s)"
}

show_active_user() {
    active_users=$(who | wc -l)
    echo "Jumlah pengguna aktif: $active_users"
}

count_folder() {
    folder_count=$(find "$1" -type d | wc -l)
    echo "Jumlah direktori di dalam $1 adalah: $folder_count"
}

download_fromURL() {
	wget "$url" -O downloaded_file.txt
	echo "File berhasil diunduh dari $url"
}

# Meminta input dari pengguna untuk memilih fitur
while true; do
echo "Pilih Fitur yang Ingin Dijalankan:"
echo "1. Tampilkan Daftar File dalam Direktori"
echo "2. Hitung Jumlah Kata dalam File Teks"
echo "3. Lihat tanggal dan waktu saat ini"
echo "4. Lihat direktori saat ini"
echo "5. Tampilkan kalender bulan ini"
echo "6. Hitung jumlah karakter dalam file"
echo "7. Tampilkan informasi sistem"
echo "8. Unduh file dari URL"
echo "9. Hitung jumlah pengguna aktif"
echo "10. Tampilkan penggunaan memori"
echo "11. Hitung jumlah folder dalam direktori"
echo "12. Tampilkan daftar proses yang sedang berjalan"
echo "13. Keluar program"
read choice

# Menjalankan fitur yang dipilih berdasarkan input pengguna
case $choice in
    1)
        echo "Masukkan direktori yang ingin ditampilkan:"
        read directory
        show_files $directory
        ;;
    2)
        echo "Masukkan nama file teks yang ingin dihitung jumlah katanya:"
        read file
        count_words $file
        ;;
    3)
	echo "Tanggal dan waktu saat ini"
	show_date
	;;
    4)
	echo "Posisi direktori saat ini"
	show_dir
	;;
    5)
	echo "Kalender bulan ini"
	cal
	;;
    6)
	echo "Masukkan nama file teks yang ingin dihitung jumlah karakternya"
	read file
	count_chars $file
	;;
    7)
        echo "Informasi Sistem:"
        show_info
        ;;
    8)
        echo "Masukkan URL yang ingin didownload"
        read url
        download_fromURL $url
        ;;
    9)
        show_active_user
        ;;
    10)
        free -h
        ;;
    11)
        echo "Masukkan path yang ingin di hitung direktorinya"
        read d
        count_folder $d
        ;;
    12)
        ps -ef
      	;;
    *)
        echo "Berhasil keluar dari program"
        ;;

esac

if [ $choice -eq 13 ]; then
	break
fi

done
