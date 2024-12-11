//
//  ProfileRepository.swift
//  Simart UMBY
//
//  Created by фкшуа on 30/11/24.
//

import Foundation

protocol ProfileRepository {
    func getProfile() async -> ProfileData?
}

class ProfileRepositoryImpl: ProfileRepository {
    func getProfile() async -> ProfileData? {
        do {
            try await Task.sleep(nanoseconds: getSecond(second: 2))
            
            return ProfileData(namaLengkap: "Cahyo", email: "cahyo@gmail.com", telepon: "082617267", username: "cahyo_", nis: "12129182", nidn: "19289128182")
        } catch {
            print("Error getProfile, Error: \(error)")
//            throw NetworkError.UnexpectedError
            return nil
        }
    }
}

enum NetworkError: Error {
    case URLError
    case ResponseError
    case UnexpectedError
}
