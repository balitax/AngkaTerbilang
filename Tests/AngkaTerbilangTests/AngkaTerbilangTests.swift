import XCTest
@testable import AngkaTerbilang

final class AngkaTerbilangTests: XCTestCase {

    func testIntToTerbilang() {
        XCTAssertEqual(0.toTerbilang(), "nol")
        XCTAssertEqual(1.toTerbilang(), "satu")
        XCTAssertEqual(15.toTerbilang(), "lima belas")
        XCTAssertEqual(123.toTerbilang(), "seratus dua puluh tiga")
        XCTAssertEqual(1000.toTerbilang(), "seribu")
    }

    func testDoubleToTerbilang() {
        XCTAssertEqual(1.5.toTerbilang(), "satu koma lima")
        XCTAssertEqual(1234.56.toTerbilang(), "seribu dua ratus tiga puluh empat koma lima enam")
    }

    func testStringToTerbilang() {
        XCTAssertEqual("15000".toTerbilang(), "lima belas ribu")
        XCTAssertEqual("1.000,5".toTerbilang(), "seribu koma lima")
        XCTAssertEqual("2.500.000".toTerbilang(), "dua juta lima ratus ribu")
    }

    func testToRupiahWithDefaultSuffix() {
        XCTAssertEqual(10000.toRupiah(), "sepuluh ribu rupiah")
        XCTAssertEqual("10000".toRupiah(), "sepuluh ribu rupiah")
    }

    func testToRupiahWithCustomPrefixSuffix() {
        XCTAssertEqual(15000.toRupiah(prefix: "Rp"), "Rp lima belas ribu rupiah")
        XCTAssertEqual("5000".toRupiah(prefix: "sekitar", suffix: "IDR"), "sekitar lima ribu IDR")
        XCTAssertEqual(2000.25.toRupiah(prefix: "±"), "± dua ribu koma dua lima rupiah")
    }

    func testInvalidStringInput() {
        XCTAssertEqual("abc".toTerbilang(), "tidak valid")
        XCTAssertEqual("12a3".toRupiah(), "tidak valid rupiah")
    }

    func testEdgeCases() {
        XCTAssertEqual(Int.max.toTerbilang().isEmpty, false)
        XCTAssertEqual(Int.min.toTerbilang().contains("minus"), true)
    }

    func testTriliunToTerbilang() {
        XCTAssertEqual(1_000_000_000_000.toTerbilang(), "satu triliun")
        XCTAssertEqual(1_234_567_890_123.toTerbilang(), "satu triliun dua ratus tiga puluh empat miliar lima ratus enam puluh tujuh juta delapan ratus sembilan puluh ribu seratus dua puluh tiga")
        XCTAssertEqual(1_000_000_000_000.toRupiah(), "satu triliun rupiah")
    }
}
