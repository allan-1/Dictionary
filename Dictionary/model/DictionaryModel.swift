//
//  DictionaryModel.swift
//  Dictionary
//
//  Created by Allan on 5/7/24.
//

import Foundation

struct DictionaryModel: Codable {
    let word: String
    let phonetic: String?
    let phonetics: [Phonetics]
    let meanings: [Meaning]
    let license: License
    let sourceUrls: [String]
}

struct Phonetics: Codable {
    let text: String
    let audio: String
    let sourceUrl: String?
    let license: License?
}

struct License: Codable {
    let name: String
    let url: String
}

struct Meaning: Codable{
    let partOfSpeech: String
    let definitions: [Definition]
}

struct Definition: Codable {
    let definition: String
    let synonyms: [String]
    let antonyms: [String]
    let example: String?
}

extension Meaning: Hashable {
    static func == (lhs: Meaning, rhs: Meaning) -> Bool {
        return lhs.partOfSpeech == rhs.partOfSpeech
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(partOfSpeech)
    }
}

extension Definition: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(definition)
        hasher.combine(synonyms)
        hasher.combine(antonyms)
    }
}

