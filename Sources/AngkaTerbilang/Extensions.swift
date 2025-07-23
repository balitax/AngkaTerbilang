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

public extension Int {
    /// Mengonversi nilai integer ke dalam bentuk terbilang bahasa Indonesia.
    ///
    /// - Parameter prefix: (Opsional) Teks yang akan ditambahkan di depan hasil terbilang.
    /// - Returns: String hasil konversi ke dalam terbilang, dengan prefix jika diberikan.
    func toTerbilang(prefix: String? = nil) -> String {
        let base = Terbilang.convert(self)
        return addPrefix(prefix, to: base)
    }

    /// Mengonversi nilai integer ke dalam bentuk terbilang beserta satuan mata uang (default: "rupiah").
    ///
    /// - Parameters:
    ///   - prefix: (Opsional) Teks yang akan ditambahkan di depan hasil terbilang.
    ///   - suffix: Satuan mata uang yang akan ditambahkan di akhir hasil konversi (default: "rupiah").
    /// - Returns: String hasil konversi ke dalam terbilang beserta satuan mata uang, dengan prefix jika diberikan.
    func toRupiah(prefix: String? = nil, suffix: String = "rupiah") -> String {
        let base = Terbilang.convertCurrency(self, suffix: suffix)
        return addPrefix(prefix, to: base)
    }
}

public extension Double {
    /// Mengonversi nilai double ke dalam bentuk terbilang bahasa Indonesia, termasuk bagian desimal.
    ///
    /// - Parameter prefix: (Opsional) Teks yang akan ditambahkan di depan hasil terbilang.
    /// - Returns: String hasil konversi ke dalam terbilang, dengan prefix jika diberikan.
    func toTerbilang(prefix: String? = nil) -> String {
        let base = Terbilang.convert(self)
        return addPrefix(prefix, to: base)
    }

    /// Mengonversi nilai double ke dalam bentuk terbilang beserta satuan mata uang (default: "rupiah").
    ///
    /// - Parameters:
    ///   - prefix: (Opsional) Teks yang akan ditambahkan di depan hasil terbilang.
    ///   - suffix: Satuan mata uang yang akan ditambahkan di akhir hasil konversi (default: "rupiah").
    /// - Returns: String hasil konversi ke dalam terbilang beserta satuan mata uang, dengan prefix jika diberikan.
    func toRupiah(prefix: String? = nil, suffix: String = "rupiah") -> String {
        let base = Terbilang.convertCurrency(self, suffix: suffix)
        return addPrefix(prefix, to: base)
    }
}

public extension String {
    /// Mengonversi string angka ke dalam bentuk terbilang bahasa Indonesia.
    ///
    /// - Parameter prefix: (Opsional) Teks yang akan ditambahkan di depan hasil terbilang.
    /// - Returns: String hasil konversi ke dalam terbilang, dengan prefix jika diberikan.
    func toTerbilang(prefix: String? = nil) -> String {
        let base = Terbilang.convert(self)
        return addPrefix(prefix, to: base)
    }

    /// Mengonversi string angka ke dalam bentuk terbilang beserta satuan mata uang (default: "rupiah").
    ///
    /// - Parameters:
    ///   - prefix: (Opsional) Teks yang akan ditambahkan di depan hasil terbilang.
    ///   - suffix: Satuan mata uang yang akan ditambahkan di akhir hasil konversi (default: "rupiah").
    /// - Returns: String hasil konversi ke dalam terbilang beserta satuan mata uang, dengan prefix jika diberikan.
    func toRupiah(prefix: String? = nil, suffix: String = "rupiah") -> String {
        let base = Terbilang.convertCurrency(self, suffix: suffix)
        return addPrefix(prefix, to: base)
    }
}

/// Menambahkan prefix pada string jika prefix diberikan dan tidak kosong.
///
/// - Parameters:
///   - prefix: (Opsional) Teks yang akan ditambahkan di depan string.
///   - text: String yang akan ditambahkan prefix.
/// - Returns: String dengan prefix di depan jika prefix diberikan, atau string asli jika tidak.
private func addPrefix(_ prefix: String?, to text: String) -> String {
    guard let prefix = prefix, !prefix.isEmpty else { return text }
    return "\(prefix) \(text)"
}
