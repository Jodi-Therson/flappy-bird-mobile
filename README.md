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
    git clone [https://github.com/NAMA_USER_ANDA/NAMA_REPO_ANDA.git](https://github.com/NAMA_USER_ANDA/NAMA_REPO_ANDA.git)
    ```

2.  **Masuk ke direktori proyek:**
    ```bash
    cd NAMA_REPO_ANDA
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
