//
//  TitleSection.swift
//  Dictionary
//
//  Created by Allan on 5/6/24.
//

import SwiftUI

struct TitleSection: View {
    let word: String
    let phonetic: String
    
    init(word: String, phonetic: String) {
        self.word = word
        self.phonetic = phonetic
    }
    
    var body: some View {
        HStack{
            VStack{
                Text(word).font(.title).fontWeight(.heavy)
                Text(phonetic).foregroundStyle(Color(hex: colorsDict["textColor"]!))
            }
            Spacer()
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Image(systemName: "play")
            })
            
        }.frame(
            minWidth: 0,
            maxWidth: .infinity,
            alignment: .leading
        ).padding(EdgeInsets(top: 0, leading: 12.0, bottom: 0, trailing: 12.0))
    }
}



extension Color {
    init(hex: Int, opacity: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 08) & 0xff) / 255,
            blue: Double((hex >> 00) & 0xff) / 255,
            opacity: opacity
        )
    }
}
