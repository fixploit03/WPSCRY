# WPSCRY

Crack Wi-Fi yang menggunakan fitur WPS (Wi-Fi Protected Setup) secara otomatis.

## Apa itu WPS dan mengapa rawan?

WPS (Wi-Fi Protected Setup) adalah fitur untuk memudahkan koneksi perangkat ke Wi-Fi. Namun, implementasi WPS sering kali memiliki kerentanan, seperti:

- **Serangan brute force pada PIN WPS**:  
  Menebak kombinasi PIN WPS hingga ditemukan yang benar.
- **Eksploitasi Pixie Dust**:  
  Teknik serangan yang memanfaatkan kelemahan dalam proses handshake WPS untuk mendapatkan PIN secara cepat.

Kerentanan ini menjadikan WPS sebagai target populer dalam uji penetrasi jaringan

## Disclaimer

Penggunaan script ini sepenuhnya merupakan tanggung jawab pengguna. WPSCRY dirancang untuk tujuan pendidikan dan pembelajaran. Penggunaan script ini untuk mengakses jaringan tanpa izin adalah ilegal dan dapat mengakibatkan konsekuensi hukum. Pembuat tidak bertanggung jawab atas penyalahgunaan atau kerusakan yang mungkin terjadi akibat penggunaan script ini.

## Persyaratan

**Hardware**:  
- OS Kali Linux
- Wi-Fi adapter (Support mode monitor)

**Software**:  
- reaver
- airmon-ng
- wireless-tools
- iw
- pixiewps

## Instalasi

> Pastikan Anda sudah berada dalam mode superuser (root).

```
apt-get update
apt-get install reaver aircrack-ng wireless-tools iw pixiewps git unzip
git clone https://github.com/fixploit03/WPSCRY.git
cd WPSCRY
chmod +x wpscry.sh
cp wpscry.sh /usr/local/bin/wpscry
```

## Run

```
wpscry
```

## Lisensi

Script ini dilisensikan di bawah lisensi MIT. Anda bebas menggunakan, memodifikasi, dan mendistribusikan script ini, dengan tetap menghormati hak cipta pembuat.

## Credits

- [reaver](https://github.com/t6x/reaver-wps-fork-t6x)
- [aircrack-ng](https://github.com/aircrack-ng/aircrack-ng)
- [wireless-tools](https://github.com/HewlettPackard/wireless-tools)
- [iw](https://github.com/Distrotech/iw)
- [pixiewps](https://github.com/wiire-a/pixiewps)
