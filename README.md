# WPSCRY

Crack Wi-Fi yang menggunakan fitur WPS (Wi-Fi Protected Setup) secara otomatis.

## Disclaimer

Penggunaan script ini sepenuhnya merupakan tanggung jawab pengguna. WPSCRY dirancang untuk tujuan pendidikan dan pembelajaran. Penggunaan script ini untuk mengakses jaringan tanpa izin adalah ilegal dan dapat mengakibatkan konsekuensi hukum. Pembuat tidak bertanggung jawab atas penyalahgunaan atau kerusakan yang mungkin terjadi akibat penggunaan script ini.

## Persyaratan

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

## Credits

- [reaver](https://github.com/t6x/reaver-wps-fork-t6x)
- [aircrack-ng](https://github.com/aircrack-ng/aircrack-ng)
- [wireless-tools](https://github.com/HewlettPackard/wireless-tools)
- [iw](https://github.com/Distrotech/iw)
- [pixiewps](https://github.com/wiire-a/pixiewps)
