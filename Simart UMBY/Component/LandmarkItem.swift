//
//  LandmarkItem.swift
//  Simart UMBY
//
//  Created by фкшуа on 08/11/24.
//

import SwiftUI

struct LandmarkItem: View {
    var landmark: LandmarkModel
    
    var body: some View {
        HStack(spacing: 10) {
            landmark.image.resizable().frame(width: 50, height: 50)
            Text(landmark.name)
            Spacer()
            if (landmark.isFavorite) {
                Image(systemName: "star.fill").frame(width: 20, height: 20).foregroundStyle(.yellow)
            }
        }
    }
}

struct LandmarkItem_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkItem(landmark: ModelData().landmarks[0])
    }
}
