//
//  LandmarkList.swift
//  Simart UMBY
//
//  Created by фкшуа on 09/11/24.
//

import SwiftUI
import Perception

struct LandmarkList: View {
    @Environment(LandmarkVM.self) var viewModel
    
    @State private var showFavoriteOnly = false
    
    var filteredLandmarks: [LandmarkModel] {
        if (showFavoriteOnly) {
            return viewModel.landmarks.filter { landmark in
                landmark.isFavorite
            }
        }

        return viewModel.landmarks
    }
    
    var body: some View {
        NavigationView {
            List {
                Toggle(isOn: $showFavoriteOnly) {
                    Text("Show Favorite").font(.system(size: 16, weight: .semibold))
                }
                ForEach(filteredLandmarks) { landmark in
                    NavigationLink {
                        LandmarkDetailView(landmark: landmark).environment(viewModel)
                    } label: {
                        LandmarkItem(landmark: landmark)
                    }
                }
            }.navigationTitle("Landmarks")
            .animation(.default, value: filteredLandmarks)
        }
    }
}

#Preview {
    LandmarkList().environment(LandmarkVM())
}
