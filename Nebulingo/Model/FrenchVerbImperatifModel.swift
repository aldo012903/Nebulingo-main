//
//  File.swift
//  FrenchVerbConjugation
//
//  Created by Daniel Carvalho on 15/11/23.
//

import Foundation



struct FrenchVerbImperatif : Codable {
    
    var present : FrenchVerbImperatifPresent?
    var passe : FrenchVerbImperatifPasse?
    
}
 
struct FrenchVerbImperatifPresent : Codable {
    
    var first : String?
    var second : String?
    var third : String?
    
    private enum CodingKeys: String, CodingKey {
        case first = "imperatifPresentFirst"
        case second = "imperatifPresentSecond"
        case third = "imperatifPresentThird"
    }

}

struct FrenchVerbImperatifPasse : Codable {
    
    var first : String?
    var second : String?
    var third : String?
    
    private enum CodingKeys: String, CodingKey {
        case first = "imperatifPasseFirst"
        case second = "imperatifPasseSecond"
        case third = "imperatifPasseThird"
    }

}
