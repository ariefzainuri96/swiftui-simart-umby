//
//  DataBarangAsetView.swift
//  Simart UMBY
//
//  Created by фкшуа on 22/11/24.
//

import SwiftUI
import Perception

struct DataBarangAsetView: View {
    let dataBarangAsetVM = DataBarangAsetVM()
    
    @Environment(DashboardVM.self) var dashboardVM
    @Binding var shouldPopToRootView: Bool
    
    var body: some View {
        WithPerceptionTracking {
            ZStack {
                ScrollView {
                    LazyVStack {
                        ForEach(dataBarangAsetVM.dataBarangAsetList) { item in
                            DataBarangAsetItem(data: item).padding(.bottom, 8)
                        }
                    }.padding(.horizontal, 16).padding(.top, 16)
                }
                
                if (dataBarangAsetVM.dataBarangAsetState == RequestState.LOADING) {
                    Text("Loading...")
                }
            }
            .navigationTitle("Data Barang Aset")
            .navigationBarTitleDisplayMode(.inline)
            .task {
                await dataBarangAsetVM.getDataBarangAset()
            }
            .onDisappear {
                dataBarangAsetVM.reset()
            }
        }
    }
}


