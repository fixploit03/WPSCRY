# WPSCRY

![License](https://img.shields.io/github/license/fixploit03/WPSCRY?style=flat-square)
![Issues](https://img.shields.io/github/issues/fixploit03/WPSCRY?style=flat-square)
![Last Commit](https://img.shields.io/github/last-commit/fixploit03/WPSCRY?style=flat-square)
![Stars](https://img.shields.io/github/stars/fixploit03/WPSCRY?style=flat-square)
![Forks](https://img.shields.io/github/forks/fixploit03/WPSCRY?style=flat-square)

Crack Wi-Fi yang menggunakan fitur [WPS](https://en.m.wikipedia.org/wiki/Wi-Fi_Protected_Setup) (Wi-Fi Protected Setup) secara otomatis.

> Script ini menggunakan reaver untuk melakukan serangan [Brute Force](https://www.exabytes.co.id/blog/brute-force-attack/) terhadap PIN WPS. Terdapat opsi tambahan untuk menggunakan [Pixie Dust](https://www.janbasktraining.com/community/cyber-security/what-is-a-pixie-dust-attack1) Attack jika pengguna mengaktifkannya.

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
apt-get install reaver aircrack-ng wireless-tools iw pixiewps git
git clone https://github.com/fixploit03/WPSCRY.git
cd WPSCRY
chmod +x wpscry.sh
cp wpscry.sh /usr/local/bin/wpscry
```

> Download ZIP: [https://github.com/fixploit03/WPSCRY/archive/refs/heads/main.zip](https://github.com/fixploit03/WPSCRY/archive/refs/heads/main.zip)

<p align="right">
  [<a href="https://github.com/fixploit03/WPSCRY#wpscry">Back To Top</a>]
</p>

## Run

```
wpscry
```

> Berikut ini adalah langkah-langkah untuk menjalankan script WPSCRY:

![](https://github.com/fixploit03/WPSCRY/blob/main/20250110_025711.png)

<p align="center">Tekan tombol Y, lalu tekan Enter.</p>

![](https://github.com/fixploit03/WPSCRY/blob/main/20250110_025850.png)

<p align="center">Masukkan nama interface Wi-Fi, lalu tekan Enter.</p>

![](https://github.com/fixploit03/WPSCRY/blob/main/20250110_025924.png)

<p align="center">Tekan tombol CTRL+C Jika Wi-Fi target sudah ditemukan.</p>

![](https://github.com/fixploit03/WPSCRY/blob/main/20250110_030017.png)

<p align="center">Masukkan BSSID dari Wi-Fi target, lalu tekan Enter.</p>

![](https://github.com/fixploit03/WPSCRY/blob/main/20250110_030049.png)

<p align="center">Masukkan Channel dari Wi-Fi target, lalu tekan Enter.</p>

![](https://github.com/fixploit03/WPSCRY/blob/main/20250110_032240.png)

<p align="center">Tekan tombol 2 , atau tekan tombol 3 untuk hasil yang lebih detail, lalu tekan Enter."</p>

![](https://github.com/fixploit03/WPSCRY/blob/main/20250110_030129.png)

<p align="center">Tekan tombol N jika tidak ingin menggunakan Pixie Dust Attack, atau tekan tombol Y lalu Enter jika ingin menggunakannya.</p>

![](https://github.com/fixploit03/WPSCRY/blob/main/20250110_030205.png)

<p align="center">Tekan Enter.</p>

![](https://github.com/fixploit03/WPSCRY/blob/main/20250110_030238.png)

<p align="center">Berhasil.</p>

<p align="right">
  [<a href="https://github.com/fixploit03/WPSCRY#wpscry">Back To Top</a>]
</p>

## Demostrasi

> [https://youtu.be/URGfY3A8iHs?si=81bz2o6H7bSoBXf0](https://youtu.be/URGfY3A8iHs?si=81bz2o6H7bSoBXf0)

<p align="right">
  [<a href="https://github.com/fixploit03/WPSCRY#wpscry">Back To Top</a>]
</p>

## Troubleshooting

> [https://github.com/fixploit03/WPSCRY/blob/main/Troubleshooting.txt](https://github.com/fixploit03/WPSCRY/blob/main/Troubleshooting.txt)

<p align="right">
  [<a href="https://github.com/fixploit03/WPSCRY#wpscry">Back To Top</a>]
</p>


## Lisensi

Script ini dilisensikan di bawah [lisensi MIT](https://github.com/fixploit03/WPSCRY/blob/main/LICENSE). Anda bebas menggunakan, memodifikasi, dan mendistribusikan script ini, dengan tetap menghormati hak cipta pembuat.

<p align="right">
  [<a href="https://github.com/fixploit03/WPSCRY#wpscry">Back To Top</a>]
</p>
