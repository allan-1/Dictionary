//
//  MeaningSection.swift
//  Dictionary
//
//  Created by Allan on 5/6/24.
//

import SwiftUI

struct MeaningSection: View {
    let partOfSpeech: String
    let definition: [Definition]
    
    var body: some View {
        VStack{
            LabelLine(label: partOfSpeech)
            Text("Meaning").frame(
                maxWidth: .infinity,
                alignment: .leading
            ).padding(EdgeInsets(top: 0, leading: 0, bottom: 8, trailing: 0))
            VStack(spacing: 0) {
                ForEach(definition, id: \.self) { data in
                    BulletListItem(text: data.definition)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
        }.frame(maxWidth: .infinity, maxHeight: .infinity).padding(EdgeInsets(top: 0, leading: 12.0, bottom: 0, trailing: 12.0))
    }
}


