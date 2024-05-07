//
//  BulletListItem.swift
//  Dictionary
//
//  Created by Allan on 5/6/24.
//

import SwiftUI

struct BulletListItem: View {
    var text: String
    
    var body: some View {
        HStack(alignment: .top, spacing: 5) {
            Text("•")
                .font(.headline)
                .fontWeight(.bold)
                .foregroundColor(.blue)
            Text(text)
                .padding(.leading, 5)
        }.padding(EdgeInsets(top: 0, leading: 0, bottom: 8.0, trailing: 0))
    }
}


#Preview {
    BulletListItem(text: "Allan")
}
