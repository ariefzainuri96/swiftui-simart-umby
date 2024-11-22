//
//  LoginVM.swift
//  Simart UMBY
//
//  Created by фкшуа on 17/11/24.
//

import Perception
import Foundation

@Perceptible class LoginVM {
    var loginForm: LoginFormModel = LoginFormModel()
    
    func login(appState: AppState) {
        UserDefaults.standard.set(true, forKey: UserDefaultsKey.IS_LOGIN)
        
        appState.isLogin = !appState.isLogin
    }
}
