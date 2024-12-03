//
//  Profile.swift
//  Simart UMBY
//
//  Created by фкшуа on 30/11/24.
//

import SwiftUI
import Perception

struct ProfileView: View {
    let profileVM = ProfileVM()
    
    var body: some View {
        WithPerceptionTracking {
            @Perception.Bindable var _profileVM = profileVM
            
            ScrollView {
                VStack(spacing: 8) {
                    CustomTextField(value: $_profileVM.profileData.namaLengkap, label: "Nama Lengkap", disabled: true)
                }.padding(.horizontal, 16)
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .task {
                await profileVM.getProfileData()
            }
            .onDisappear {
                profileVM.resetData()
            }
        }
    }
}
