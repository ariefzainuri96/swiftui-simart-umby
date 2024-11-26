//
//  News.swift
//  Simart UMBY
//
//  Created by фкшуа on 26/11/24.
//

import SwiftUI

struct NewsSection: View {
    @State private var currentIndex: Int = 0
    
    var body: some View {
        GeometryReader { geometry in
            let itemWidth = geometry.size.width * 0.8 // Item width is 80% of the screen width
            let spacing: CGFloat = 16 // Spacing between items
            let totalWidth = itemWidth + spacing // Total width of each item plus spacing
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: spacing) {
                    ForEach(0..<3, id: \.self) { index in
                        NewsItem(itemWidth: itemWidth)
                    }
                }
                .padding(.horizontal, 12) // Ensure partial visibility
                .offset(x: CGFloat(currentIndex) * -totalWidth, y: 0)
                
            }
        }.frame(maxHeight: 140)
    }
}

struct NewsItem: View {
    var itemWidth: CGFloat
    
    let fullText = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque enim gravida massa in praesent dictum orci blandit diam. Quis duis purus senectus sit pellentesque"
    
    let limit: Int = 100
    
    func getAttributedString() -> AttributedString {
        var string = AttributedString("\(fullText.prefix(limit))...")
        string.foregroundColor = .white
        string.font = .systemFont(ofSize: 14, weight: .light)
        
        // Terms of Conditions
        var tappableBacaSelengkapnyaText = AttributedString(" Baca Selengkapnya")
        tappableBacaSelengkapnyaText.link = URL(string: "BS://")
        tappableBacaSelengkapnyaText.foregroundColor = Color("#2F80ED")
        tappableBacaSelengkapnyaText.font = .systemFont(ofSize: 14, weight: .light)
        tappableBacaSelengkapnyaText.underlineStyle = .single
        string.append(tappableBacaSelengkapnyaText)
        
        return string
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Test Pengumuman").font(.system(size: 14, weight: .medium)).foregroundColor(.white).padding(.bottom, 4)
            
            Text("5 Februari 2024").font(.system(size: 12)).foregroundColor(.white).padding(.bottom, 8)
            
            if fullText.count <= limit {
                // Show full text if expanded or text is within the limit
                Text(fullText)
                    .font(.system(size: 14, weight: .light))
                    .foregroundColor(.white)
            } else {
                // Truncated text with "Baca Selengkapnya" right after "..."
                Text(getAttributedString())
                    .environment(\.openURL, OpenURLAction { url in
                        if url.absoluteString == "BS://"{
                            print("Baca selengkapnya clicked")
                        }
                        return .discarded
                    })
            }
        }.frame(width: itemWidth).padding(.vertical, 16).background(Color("213168")).cornerRadius(8)
    }
}
