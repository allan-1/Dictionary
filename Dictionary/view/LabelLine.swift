//
//  LabelLine.swift
//  Dictionary
//
//  Created by Allan on 5/6/24.
//

import SwiftUI

struct LabelLine: View {
    
    let label: String
    let color: Color
    let horizontalPadding: CGFloat
    
    init(label: String, horizontalPadding: CGFloat = 20, color: Color = .gray) {
            self.label = label
            self.horizontalPadding = horizontalPadding
            self.color = color
        }
    
    var body: some View {
        HStack{
            Text(label).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).italic()
            line
        }
    }
    
    var line: some View{
        VStack { Divider().background(color) }.padding(horizontalPadding)
    }
}

