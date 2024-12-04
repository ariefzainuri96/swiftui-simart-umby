//
//  EditDataBarangAsetView.swift
//  Simart UMBY
//
//  Created by фкшуа on 05/12/24.
//

import SwiftUI

struct EditDataBarangAsetView: View {
    let data: DataBarangAsetModel
    
    var body: some View {
        ScrollView {
            VStack {
                Text(data.namaBarang)
                
                CustomButtonBottomSheet(label: "Testing", value: "value 1")
            }
        }.navigationTitle("Edit Data Barang Aset").navigationBarTitleDisplayMode(.inline)
    }
}
