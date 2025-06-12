# Flappy Bird Clone with Flutter

Sebuah game kloning Flappy Bird klasik yang dibuat sepenuhnya menggunakan Flutter dan Flame Engine. Proyek ini merupakan hasil konversi dari game serupa yang awalnya dibuat dengan Python (Pygame).

## ✨ Fitur

-   Gameplay Flappy Bird klasik: Lompat untuk menghindari pipa.
-   Animasi karakter burung dan pergerakan latar belakang.
-   Sistem skor yang bertambah setiap melewati rintangan.
-   Deteksi tabrakan dengan pipa dan tanah.
-   Efek suara untuk lompatan, skor, dan tabrakan.
-   Penyimpanan skor tertinggi (High Score) secara lokal di perangkat.
-   Layar "Game Over" dengan opsi untuk memulai kembali.

## 🚀 Teknologi yang Digunakan

-   **Flutter:** Framework UI dari Google untuk membangun aplikasi cross-platform.
-   **Flame Engine:** Game engine 2D berbasis komponen untuk Flutter.
-   **Bahasa:** Dart

## ⚙️ Memulai Proyek

Untuk menjalankan proyek ini di komputer Anda, ikuti langkah-langkah berikut.

### Prasyarat

-   Pastikan Anda sudah menginstal **Flutter SDK** di komputer Anda. Untuk memverifikasi, jalankan perintah `flutter doctor` di terminal.
-   Sebuah editor kode seperti **VS Code** atau **Android Studio**.
-   Emulator, browser (Chrome), atau perangkat fisik untuk menjalankan aplikasi.

### Instalasi & Menjalankan

1.  **Clone repositori ini:**
    ```bash
    git clone https://github.com/Jodi-Therson/flappy-bird-mobile.git
    ```

2.  **Masuk ke direktori proyek:**
    ```bash
    cd flappy-bird-mobile
    ```

3.  **Dapatkan semua paket yang dibutuhkan:**
    ```bash
    flutter pub get
    ```

4.  **Jalankan aplikasi:**
    Pilih perangkat target (misalnya Chrome, Emulator Android), lalu jalankan perintah berikut di terminal.
    ```bash
    flutter run
    ```
    Atau tekan `F5` di Visual Studio Code untuk memulai sesi debugging.

## 📂 Struktur Proyek

Proyek ini mengikuti struktur standar aplikasi Flutter dengan penambahan direktori khusus untuk game.

```
flappy_bird_game/
├── assets/
│   ├── audio/
│   │   ├── crash.mp3
│   │   ├── sfx_point.mp3
│   │   └── sfx_wing.mp3
│   └── images/
│       ├── bg.png
│       ├── bird1.png, bird2.png, bird3.png
│       ├── ground.png
│       ├── pipe.png
│       └── restart.png
├── lib/
│   ├── components/
│   │   ├── bird.dart
│   │   ├── ground.dart
│   │   └── pipe.dart
│   ├── game/
│   │   └── flappy_bird_game.dart
│   └── main.dart
├── .gitignore
├── pubspec.yaml
└── README.md
```

## 📦 Membuat File APK untuk Distribusi

Setelah Anda selesai mengembangkan dan ingin membagikan game ini sebagai file yang bisa diinstal di perangkat Android, Anda perlu membuat file APK (Android Package Kit) versi rilis.

Proses ini akan mengkompilasi kode menjadi versi yang teroptimasi, lebih kecil ukurannya, dan lebih cepat performanya.

1.  **Buka Terminal**
    Pastikan terminal atau command prompt Anda berada di dalam direktori utama proyek (`flappy-bird-mobile/`).

2.  **Jalankan Perintah Build**
    Ketikkan perintah berikut untuk memulai proses build:
    ```bash
    flutter build apk
    ```

3.  **Temukan File APK**
    Setelah proses selesai, file `.apk` Anda akan berada di dalam folder berikut:
    ```
    build/app/outputs/flutter-apk/app-release.apk
    ```

4.  **Instal di Perangkat Android**
    Anda bisa memindahkan file `app-release.apk` ke HP Anda menggunakan beberapa cara:
    * **Kabel USB:** Salin file ke penyimpanan internal atau kartu SD HP Anda, lalu buka menggunakan aplikasi File Manager untuk menginstalnya.
    * **Cloud/Email:** Unggah file ke Google Drive, Dropbox, atau kirim ke email Anda sendiri, lalu unduh dan instal di HP.

    > **Catatan:** Saat pertama kali menginstal, Anda mungkin perlu memberikan izin pada HP Anda untuk "Menginstal aplikasi dari sumber yang tidak dikenal" (_Install from unknown sources_) di pengaturan keamanan.

---
### **Penting: APK vs. App Bundle (AAB)**
Jika tujuan akhir Anda adalah mempublikasikan aplikasi ke **Google Play Store**, Google mewajibkan Anda untuk mengunggah dalam format `.aab` (Android App Bundle), bukan `.apk`. Untuk membuatnya, gunakan perintah:
```
flutter build appbundle
```
