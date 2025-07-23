# AngkaTerbilang

Konversi angka ke teks terbilang Bahasa Indonesia, lengkap dengan dukungan satuan mata uang dan format desimal. Cocok untuk aplikasi keuangan, laporan, dan kebutuhan lain yang memerlukan angka dalam bentuk kata.

## Fitur
- Konversi angka (`Int`, `Double`, `String`) ke teks terbilang Bahasa Indonesia
- Dukungan angka besar (hingga triliun)
- Dukungan angka negatif
- Dukungan angka desimal (misal: 1.5 → "satu koma lima")
- Konversi ke format mata uang (default: rupiah, bisa custom)
- Penanganan input string dengan format ribuan/koma
- Ekstensi Swift: `.toTerbilang()`, `.toRupiah()` untuk `Int`, `Double`, dan `String`
- Penanganan edge case (nol, negatif, Int.min, input tidak valid)

## Instalasi

### Swift Package Manager (SPM)
Tambahkan ke dependencies di `Package.swift`:
```swift
.package(url: "https://github.com/balitax/AngkaTerbilang.git", from: "1.0.0")
```
Lalu tambahkan ke target dependencies:
```swift
.target(
    name: "YourTarget",
    dependencies: ["AngkaTerbilang"]
)
```
Atau, pada Xcode:
- File > Add Packages > masukkan URL repo ini

## Cara Pakai
Import modul di file Swift-mu:
```swift
import AngkaTerbilang
```
Contoh penggunaan:
```swift
let angka = 15000
print(angka.toTerbilang()) // "lima belas ribu"
print(angka.toRupiah())    // "lima belas ribu rupiah"

let nilai = 1234.56
print(nilai.toTerbilang()) // "seribu dua ratus tiga puluh empat koma lima enam"

let teks = "2.500.000"
print(teks.toTerbilang())  // "dua juta lima ratus ribu"

// Custom prefix/suffix
print(angka.toRupiah(prefix: "sekitar", suffix: "IDR")) // "sekitar lima belas ribu IDR"
print(teks.toRupiah(prefix: "Terbilang")) // "Terbilang dua juta lima ratus ribu rupiah"

// Penanganan input tidak valid
print("abc".toTerbilang()) // "tidak valid"

let besar = 1_234_567_890_123
print(besar.toTerbilang()) // "satu triliun dua ratus tiga puluh empat miliar lima ratus enam puluh tujuh juta delapan ratus sembilan puluh ribu seratus dua puluh tiga"
```

## Testing
Jalankan unit test dengan Swift Package Manager:
```sh
swift test
```
Atau dari Xcode: Product > Test

## Kontribusi
Kontribusi sangat terbuka! Silakan:
1. Fork repo ini
2. Buat branch baru untuk fitur/bugfix
3. Commit perubahanmu
4. Buat Pull Request (PR) ke branch `main`

Pastikan:
- Kode sudah teruji (unit test tidak gagal)
- Ikuti gaya penulisan Swift yang konsisten
- Sertakan deskripsi jelas pada PR

## Lisensi
MIT License © 2025 Agus Cahyono 