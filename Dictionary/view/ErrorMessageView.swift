//
//  ErrorMessageView.swift
//  Dictionary
//
//  Created by Allan on 5/7/24.
//

import SwiftUI

struct ErrorMessageView: View {
    let title: String
    let message: String
    var body: some View {
        VStack{
            Image(systemName: "face.smiling.inverse").resizable().foregroundColor(.yellow)
                .frame(width: 50.0, height: 50.0).padding(.bottom, 8)
            Text(title).fontWeight(.bold).font(.title3)
            Text(message)
        }
    }
}

#Preview {
    ErrorMessageView(title: "No data", message: "Bad Data")
}
