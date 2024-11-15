//
//  GetStartedView.swift
//  Simart UMBY
//
//  Created by фкшуа on 06/11/24.
//

import SwiftUI
import Perception

struct LandmarkDetailView: View {
    @Perception.Bindable var viewModel: LandmarkVM
    
    var landmark: LandmarkModel
    
    private var landmarkIndex: Int {
        viewModel.landmarks.firstIndex(where: { $0.id == landmark.id })!
    }
    
    var body: some View {
        WithPerceptionTracking {
            ScrollView {
                VStack(spacing: 0) {
                    MapView(data: landmark).frame(height: 300)
                    
                    landmark.image.frame(width: 150, height: 150).clipShape(Circle()).overlay(Circle().stroke(.white, lineWidth: 4)).shadow(radius: 7).offset(y: -80).padding(.bottom, -60)
                    
                    VStack(alignment: .leading) {
                        HStack {
                            Text(landmark.name)
                                .font(.title)
                                .cornerRadius(8)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            FavoriteButton(isSet: $viewModel.landmarks[landmarkIndex].isFavorite)
                        }.padding(.horizontal, 16).padding(.bottom, 4)
                        
                        HStack(alignment: .top, spacing: 0) {
                            Text(landmark.park)
                                .font(.subheadline).frame(maxWidth: .infinity, alignment: .leading)
                            
                            Text(landmark.state).font(.subheadline)
                                                        
                        }.padding(.horizontal, 16).foregroundColor(.gray)
                    }
                    
                    Divider().padding(.vertical, 16)
                    
                    HStack {
                        Text("About \(landmark.name)").font(.system(size: 20, weight: .medium))
                        
                        Spacer()
                    }.padding(.horizontal, 16)
                    
                    Text(landmark.description).padding(.horizontal, 16).padding(.top, 8)
                    
                    Spacer()
                }
            }.navigationTitle("\(landmark.name)").navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    let viewModel = LandmarkVM()
    
    LandmarkDetailView(viewModel: viewModel, landmark: viewModel.landmarks[0])
    
}
