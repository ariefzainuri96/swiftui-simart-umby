//
//  ProfileVM.swift
//  Simart UMBY
//
//  Created by фкшуа on 30/11/24.
//

import Perception
import Foundation
import SwiftUI

@Perceptible class ProfileVM {
    private let profileRepo = ProfileRepositoryImpl()
    
    var profileData = ProfileData()
    var profileState = RequestState.IDLE
    
    func getProfileData() async {
        profileState = RequestState.LOADING
        
        let data = await profileRepo.getProfile()
        
        profileState = data == nil ? RequestState.ERROR : RequestState.SUCCESS
        
        guard let _data = data else { return }
        
        profileData = _data
        
        print("getProfileData -> \(_data.namaLengkap)")
    }
    
    func resetData() {
        profileData = ProfileData()
    }
}
