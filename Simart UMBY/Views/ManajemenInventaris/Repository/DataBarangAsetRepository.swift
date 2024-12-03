//
//  DataBarangAsetRepository.swift
//  Simart UMBY
//
//  Created by фкшуа on 03/12/24.
//

import Foundation

protocol DataBarangAsetRepository {
    func getDataBarangAset() async -> [DataBarangAsetModel]?
}

class DataBarangAsetRepositoryImpl: DataBarangAsetRepository {
    func getDataBarangAset() async -> [DataBarangAsetModel]? {
        do {
            try await Task.sleep(nanoseconds: getSecond(second: 2))
            
            let data = [
                DataBarangAsetModel(id: "1", namaBarang: "Nama Barang 1", noBarang: "noBarang 1", jumlah: "10", ruang: "Ruang 4D", deskripsi: "Contoh Deskripsi 1", spesifikasi: "Contoh Spesifikasi 1"),
                DataBarangAsetModel(id: "2", namaBarang: "Nama Barang 2", noBarang: "noBarang 2", jumlah: "10", ruang: "Ruang 4D", deskripsi: "Contoh Deskripsi 2", spesifikasi: "Contoh Spesifikasi 2"),
            ]
            
            let jsonData = try JSONEncoder().encode(data)
//            let jsonString = String(data: jsonData, encoding: .utf8)!
            
            let decodedData = try JSONDecoder().decode([DataBarangAsetModel].self, from: jsonData)
            
            return decodedData
        } catch {
            print("Error happen: \(error)")
            return nil
        }
    }
}
