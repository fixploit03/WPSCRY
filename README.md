# WPSCRY

Crack Wi-Fi yang menggunakan fitur [WPS](https://en.m.wikipedia.org/wiki/Wi-Fi_Protected_Setup) (Wi-Fi Protected Setup) secara otomatis.

## Apa itu WPS dan mengapa rawan?

![](https://github.com/fixploit03/WPSCRY/blob/main/wps.jpeg)

WPS (Wi-Fi Protected Setup) adalah fitur untuk memudahkan koneksi perangkat ke Wi-Fi. Namun, implementasi WPS sering kali memiliki kerentanan, seperti:

- **Serangan brute force pada PIN WPS**:  
  Menebak kombinasi PIN WPS hingga ditemukan yang benar.
- **Eksploitasi Pixie Dust**:  
  Teknik serangan yang memanfaatkan kelemahan dalam proses handshake WPS untuk mendapatkan PIN secara cepat.

Kerentanan ini menjadikan WPS sebagai target populer dalam uji penetrasi jaringan

<p align="right">
  [<a href="https://github.com/fixploit03/WPSCRY#wpscry">Back To Top</a>]
</p>

## Disclaimer

![](https://github.com/fixploit03/WPSCRY/blob/main/giphy.gif)

Penggunaan script ini sepenuhnya merupakan tanggung jawab pengguna. WPSCRY dirancang untuk tujuan pendidikan dan pembelajaran. Penggunaan script ini untuk mengakses jaringan tanpa izin adalah ilegal dan dapat mengakibatkan [konsekuensi hukum](https://sippn.menpan.go.id/berita/39427/rumah-tahanan-negara-kelas-iib-pelaihari/menggunakan-wi-fi-tetangga-tanpa-izin-bisa-dijerat-hukum). Pembuat tidak bertanggung jawab atas penyalahgunaan atau kerusakan yang mungkin terjadi akibat penggunaan script ini.

<p align="right">
  [<a href="https://github.com/fixploit03/WPSCRY#wpscry">Back To Top</a>]
</p>

## Persyaratan

**Hardware**:  
- OS [Kali Linux](https://www.kali.org/)
- Wi-Fi adapter ([Support mode monitor](https://www.ceos3c.com/security/best-wifi-adapter-for-kali-linux/))

**Software**:  
- [reaver](https://github.com/t6x/reaver-wps-fork-t6x)
- [airmon-ng](https://github.com/aircrack-ng/aircrack-ng)
- [wireless-tools](https://github.com/HewlettPackard/wireless-tools)
- [iw](https://github.com/Distrotech/iw)
- [pixiewps](https://github.com/wiire-a/pixiewps)

<p align="right">
  [<a href="https://github.com/fixploit03/WPSCRY#wpscry">Back To Top</a>]
</p>

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

<p align="right">
  [<a href="https://github.com/fixploit03/WPSCRY#wpscry">Back To Top</a>]
</p>

## Run

```
wpscry
```

<p align="right">
  [<a href="https://github.com/fixploit03/WPSCRY#wpscry">Back To Top</a>]
</p>

## Lisensi

Script ini dilisensikan di bawah [lisensi MIT](https://github.com/fixploit03/WPSCRY/blob/main/LICENSE). Anda bebas menggunakan, memodifikasi, dan mendistribusikan script ini, dengan tetap menghormati hak cipta pembuat.

<p align="right">
  [<a href="https://github.com/fixploit03/WPSCRY#wpscry">Back To Top</a>]
</p>
