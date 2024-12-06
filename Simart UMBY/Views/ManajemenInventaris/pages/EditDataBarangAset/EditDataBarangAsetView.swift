//
//  EditDataBarangAsetView.swift
//  Simart UMBY
//
//  Created by фкшуа on 05/12/24.
//

import SwiftUI
import Perception

struct EditDataBarangAsetView: View {
    let data: DataBarangAsetModel
    
    let viewModel = EditDataBarangAsetVM()
    
    var body: some View {
        WithPerceptionTracking {
            ZStack {
                Color(.white)
                
                ScrollView {
                    VStack {
                        Text(viewModel.detailData.namaAset ?? "-")
                        
                        CustomButtonBottomSheet(label: "Test", value: "Value") {
                            BottomSheetDropdown(title: "Pilih Vendor") {
                                BottomSheetVendor(viewModel: viewModel)
                            }
                        }
                    }
                }.navigationTitle("Edit Data Barang Aset").navigationBarTitleDisplayMode(.inline)
            }.task {
                let vendorTask = Task {
                    await viewModel.getVendor()
                }
                let detailDataTask = Task {
                    await viewModel.getDetailData(data: data)
                }
                
                // Await both tasks to ensure completion
                await vendorTask.value
                await detailDataTask.value
            }
        }
    }
}

struct BottomSheetVendor: View {
    let viewModel: EditDataBarangAsetVM
    
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(Array(viewModel.vendor.enumerated()), id: \.offset) { index, item in
                    SimpleText(content: item) {
                        if (index == viewModel.vendor.count - 1) {
                            Task {
                                await viewModel.getVendor(isInitial: false)
                            }
                        }
                    }
                }
            }.padding(.horizontal, 16)
        }
    }
}
