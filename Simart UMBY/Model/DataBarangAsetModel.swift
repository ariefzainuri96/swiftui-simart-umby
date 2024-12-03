//
//  DataBarangAsetModel.swift
//  Simart UMBY
//
//  Created by фкшуа on 03/12/24.
//

struct DataBarangAsetModel: Identifiable, Codable {
    let id: String
    var namaBarang: String
    var noBarang: String
    var jumlah: String
    var ruang: String
    var deskripsi: String
    var spesifikasi: String
}
