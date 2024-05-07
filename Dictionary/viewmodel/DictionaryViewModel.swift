//
//  DictionaryViewModel.swift
//  Dictionary
//
//  Created by Allan on 5/6/24.
//

import Foundation
import Combine

class DictionaryViewModel: ObservableObject{
    
    @Published var searchQuery = ""
    
    @Published var fetchedMeaning: [DictionaryModel]? = nil
    
    @Published var errorMessage: ErrorModel? = nil
    
    var searchCancellable: AnyCancellable? = nil
    
    init() {
        searchCancellable = $searchQuery.removeDuplicates().debounce(for: 0.6, scheduler: RunLoop.main).sink(receiveValue: {
            str in
            if str == ""{
                self.fetchedMeaning = nil
            }else{
                self.searchMeaning()
            }
        })
    }
    
    func searchMeaning() {
        let url = "https://api.dictionaryapi.dev/api/v2/entries/en/\(searchQuery)"
        
        guard let apiUrl = URL(string: url) else {
            print("Invalid URL")
            return
        }
        
        let session = URLSession(configuration: .default)
        
        session.dataTask(with: apiUrl) { (data, response, error) in
            if let error = error {
                print("Error fetching data: \(error.localizedDescription)")
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                if let data = data {
                    do {
                        let errorResponse = try JSONDecoder().decode(ErrorModel.self, from: data)
                        DispatchQueue.main.async {
                            self.errorMessage = errorResponse
                        }
                        
                        print("Error message: \(errorResponse.message)")
                    } catch {
                        print("Failed to decode error response: \(error)")
                    }
                } else {
                    print("Invalid response")
                }
                    return

            }
            
            guard let responseData = data else {
                print("No data received")
                return
            }
            
            do {
                let meanings = try JSONDecoder().decode([DictionaryModel].self, from: responseData)
                DispatchQueue.main.async {
                    self.fetchedMeaning = meanings
                }
            } catch {
                print("Error decoding data: \(error)")
                if let dataString = String(data: responseData, encoding: .utf8) {
                    print("Raw data: \(dataString)")
                }
            }
        }.resume()
    }

}
