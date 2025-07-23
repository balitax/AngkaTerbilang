/*
MIT License

Copyright (c) 2025 Agus Cahyono

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
*/

import Foundation

struct Terbilang {
    /// Mengonversi nilai integer ke dalam bentuk terbilang bahasa Indonesia.
    ///
    /// - Parameter value: Nilai integer yang akan dikonversi.
    /// - Returns: String hasil konversi ke dalam terbilang.
    static func convert(_ value: Int) -> String {
        if value == 0 { return "nol" }
        if value == Int.min { return "minus " + convert(Int.max) + " satu" }
        if value < 0 { return "minus " + convert(abs(value)) }
        return convertInt(value).trimmingCharacters(in: .whitespaces).replacingOccurrences(of: "  ", with: " ")
    }

    /// Mengonversi nilai double ke dalam bentuk terbilang bahasa Indonesia, termasuk bagian desimal.
    ///
    /// - Parameter value: Nilai double yang akan dikonversi.
    /// - Returns: String hasil konversi ke dalam terbilang, dengan "koma" untuk bagian desimal.
    static func convert(_ value: Double) -> String {
        let components = String(value).split(separator: ".")
        let intPart = Int(components[0]) ?? 0
        let fractionalPart = components.count > 1 ? components[1] : ""
        let intWords = convert(intPart)
        let fractionWords = fractionalPart.map { convert(Int(String($0)) ?? 0) }.joined(separator: " ")
        return fractionWords.isEmpty ? intWords : "\(intWords) koma \(fractionWords)"
    }

    /// Mengonversi nilai string ke dalam bentuk terbilang bahasa Indonesia.
    ///
    /// - Parameter value: String yang berisi angka yang akan dikonversi.
    /// - Returns: String hasil konversi ke dalam terbilang, atau "tidak valid" jika input tidak dapat dikonversi.
    static func convert(_ value: String) -> String {
        let normalized = normalizeInput(value)
        if let intVal = Int(normalized) {
            return convert(intVal)
        } else if let doubleVal = Double(normalized) {
            return convert(doubleVal)
        }
        return "tidak valid"
    }

    /// Mengonversi nilai string ke dalam bentuk terbilang beserta satuan mata uang.
    ///
    /// - Parameters:
    ///   - value: String yang berisi angka yang akan dikonversi.
    ///   - suffix: Satuan mata uang yang akan ditambahkan di akhir hasil konversi.
    /// - Returns: String hasil konversi ke dalam terbilang beserta satuan mata uang.
    static func convertCurrency(_ value: String, suffix: String) -> String {
        return convert(value) + " " + suffix
    }

    /// Mengonversi nilai integer ke dalam bentuk terbilang beserta satuan mata uang.
    ///
    /// - Parameters:
    ///   - value: Nilai integer yang akan dikonversi.
    ///   - suffix: Satuan mata uang yang akan ditambahkan di akhir hasil konversi.
    /// - Returns: String hasil konversi ke dalam terbilang beserta satuan mata uang.
    static func convertCurrency(_ value: Int, suffix: String) -> String {
        return convert(value) + " " + suffix
    }

    /// Mengonversi nilai double ke dalam bentuk terbilang beserta satuan mata uang.
    ///
    /// - Parameters:
    ///   - value: Nilai double yang akan dikonversi.
    ///   - suffix: Satuan mata uang yang akan ditambahkan di akhir hasil konversi.
    /// - Returns: String hasil konversi ke dalam terbilang beserta satuan mata uang.
    static func convertCurrency(_ value: Double, suffix: String) -> String {
        return convert(value) + " " + suffix
    }

    /// Fungsi internal untuk mengonversi angka integer ke dalam bentuk terbilang bahasa Indonesia.
    ///
    /// - Parameter number: Nilai integer yang akan dikonversi.
    /// - Returns: String hasil konversi ke dalam terbilang.
    private static func convertInt(_ number: Int) -> String {
        let angka = [
            "", "satu", "dua", "tiga", "empat", "lima",
            "enam", "tujuh", "delapan", "sembilan"
        ]

        switch number {
        case 1_000_000_000_000...:
            return "\(convertInt(number / 1_000_000_000_000)) triliun \(convertInt(number % 1_000_000_000_000))"
        case 1_000_000_000...:
            return "\(convertInt(number / 1_000_000_000)) miliar \(convertInt(number % 1_000_000_000))"
        case 1_000_000...:
            return "\(convertInt(number / 1_000_000)) juta \(convertInt(number % 1_000_000))"
        case 1_000...:
            let prefix = number / 1_000 == 1 ? "seribu" : "\(convertInt(number / 1_000)) ribu"
            return "\(prefix) \(convertInt(number % 1_000))"
        case 100...:
            let prefix = number / 100 == 1 ? "seratus" : "\(convertInt(number / 100)) ratus"
            return "\(prefix) \(convertInt(number % 100))"
        case 20...:
            return "\(convertInt(number / 10)) puluh \(convertInt(number % 10))"
        case 13...19:
            return "\(convertInt(number % 10)) belas"
        case 12:
            return "dua belas"
        case 11:
            return "sebelas"
        case 10:
            return "sepuluh"
        case 1..<10:
            return angka[number]
        default:
            return ""
        }
    }

    /// Fungsi internal untuk menormalkan input string angka agar dapat diproses dengan benar.
    ///
    /// - Parameter input: String angka yang akan dinormalisasi.
    /// - Returns: String angka yang sudah dinormalisasi (menghilangkan pemisah ribuan, mengganti koma menjadi titik, dsb).
    private static func normalizeInput(_ input: String) -> String {
        let trimmed = input.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if trimmed.contains(",") && trimmed.contains(".") {
            let withoutDots = trimmed.replacingOccurrences(of: ".", with: "")
            return withoutDots.replacingOccurrences(of: ",", with: ".")
        }
        if trimmed.contains(",") {
            return trimmed.replacingOccurrences(of: ",", with: ".")
        }
        let parts = trimmed.components(separatedBy: ".")
        if parts.count > 1 && parts.last?.count ?? 0 <= 2 {
            return trimmed
        } else {
            return trimmed.replacingOccurrences(of: ".", with: "")
        }
    }
}
