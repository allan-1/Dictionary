//
//  HomeView.swift
//  Dictionary
//
//  Created by Allan on 5/6/24.
//

import SwiftUI

struct HomeView: View {
    @StateObject var dictionaryData = DictionaryViewModel()
    
    var body: some View {
        NavigationView{
            ScrollView{
                VStack{
                    HStack(spacing: 10){
                        Image(systemName: "magnifyingglass").foregroundColor(.gray)
                        TextField("Search for any word", text: $dictionaryData.searchQuery)
                    }.padding(.vertical, 10).padding(.horizontal).background(Color.white)
                        .shadow(color: Color.black.opacity(0.06), radius: 5, x:5, y: 5)
                        .shadow(color: Color.black.opacity(0.06), radius: 5, x: -5, y: -5)
                }.padding()
                if let meaning = dictionaryData.fetchedMeaning{
                    if meaning.isEmpty{
                        Text("No result")
                    }else{
                        VStack{
                            TitleSection(word: meaning[0].word, phonetic: meaning[0].phonetic ?? "")
                            ForEach(meaning[0].meanings, id: \.self){meaning in
                                MeaningSection(partOfSpeech: meaning.partOfSpeech, definition: meaning.definitions)
                            }
                        }
                    }
                }else{
                    if dictionaryData.searchQuery != ""{
                        ProgressView().padding(.top, 20)
                    }
                }
            }.navigationTitle("Dictionary")
        }
    }
}


#Preview {
    HomeView()
}
