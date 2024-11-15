//
//  ModelData.swift
//  Simart UMBY
//
//  Created by фкшуа on 08/11/24.
//

import Foundation
import Perception

@Perceptible class LandmarkVM {
    var landmarks: [LandmarkModel] = load("landmarkData.json")
}
