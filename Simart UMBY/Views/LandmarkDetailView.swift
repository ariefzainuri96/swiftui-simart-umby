//
//  GetStartedView.swift
//  Simart UMBY
//
//  Created by фкшуа on 06/11/24.
//

import SwiftUI

struct GetStartedView: View {
    var body: some View {
        VStack(spacing: 0) {
            MapView().frame(height: 300)
            
            CircleImageView()
            
            VStack(alignment: .leading) {
                            Text("Turtle Rock")
                    .font(.title).padding(.horizontal, 10).padding(.bottom, 10)
                HStack(alignment: .top, spacing: 0) {
                                Text("Joshua Tree National Park askdjaklj alksdjaklsjd kjaskldjaksjdklajsdklasjdkalsjdkasjdksjd")
                        .font(.subheadline).background(.blue)
                                
                                Text("California asd asd asda asda sdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasd asda asdas asdas dasd asd asdad asd asdas dasd as d")
                                    .font(.subheadline).background(.red)
                            }.padding(.horizontal, 10)
                        }
            
            Spacer()
        }
    }
}

struct GetStartedView_Previews: PreviewProvider {
    static var previews: some View {
        GetStartedView()
    }
}
