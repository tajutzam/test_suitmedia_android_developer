# test_suitmedia

## Deskripsi Proyek

Proyek ini adalah aplikasi Flutter yang dirancang untuk menampilkan daftar pengguna yang diambil dari API Regres in, memungkinkan pengguna untuk memilih pengguna dari daftar, dan menampilkan detail pengguna yang dipilih. Aplikasi ini menggunakan GetX untuk manajemen status dan navigasi serta memanfaatkan Google Fonts untuk penyesuaian tema. project ini digunakan untuk memenuhi test untuk kebutuhan magang sebagai android developer di pt suitmedia

## Fitur Utama

- **Daftar Pengguna**: Menampilkan daftar pengguna yang diambil dari API dengan dukungan untuk memuat lebih banyak data saat menggulir ke bawah.
- **Penyegaran Tarik untuk Memuat Ulang**: Menyediakan fitur penyegaran tarik untuk memuat ulang data pengguna.
- **Detail Pengguna Terpilih**: Menampilkan nama pengguna yang dipilih pada layar second.

## Teknologi yang Digunakan

- **Flutter**: Framework untuk membangun aplikasi mobile.
- **GetX**: Manajemen status, rute, dan dependensi.
- **Google Fonts**: Penyesuaian font untuk aplikasi.
- **API**: Mengambil data pengguna dari API eksternal.
- **Asset Management**: Menggunakan gambar dari aset untuk latar belakang dan ikon.

## Struktur Aplikasi

1. **Main Screen**:
   - Menampilkan form untuk memasukkan nama dan kalimat.
   - Memeriksa apakah kalimat adalah palindrome atau tidak.
   - Tombol "Check" untuk memeriksa palindrom dan "Next" untuk berpindah ke layar berikutnya.

2. **Second Screen**:
   - Menampilkan nama pengguna yang dipilih dari daftar pada layar thrid dan juga label dari nama input layar sebelumnya.

3. **Third Screen**:
   - Menampilkan daftar pengguna dengan kemampuan untuk memuat lebih banyak data saat menggulir ke bawah dan menarik untuk menyegarkan.
   - Menampilkan status pemuatan dan pesan jika tidak ada data.
   - jika memilih salah satu user maka akan kembali ke screen second dan akan menampilkan firstname + " " +lastname

## Instalasi 

   - clone repository ini
   - cd test_suitmedia
   - install package
```bash
    flutter pub get
```
    - Jalankan Applikasi
```bash
    flutter run
```
