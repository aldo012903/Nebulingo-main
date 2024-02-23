//
//  File.swift
//  FrenchVerbConjugation
//
//  Created by Daniel Carvalho on 15/11/23.
//

import Foundation


struct FrenchVerbSubjonctif : Codable {
    
    var present : FrenchVerbSubjonctifPresent?
    var passe : FrenchVerbSubjonctifPasse?
    var imparfait : FrenchVerbSubjonctifImparfait?
    var plusQueParfait : FrenchVerbSubjonctifPlusQueParfait?
    
    
}

struct FrenchVerbSubjonctifPresent : Codable {
    
    var i : String?
    var you : String?
    var heSheIt : String?
    var we : String?
    var youAll : String?
    var they : String?
    
    private enum CodingKeys: String, CodingKey {
        case i = "subjonctifPresentI"
        case you = "subjonctifPresentYou"
        case heSheIt = "subjonctifPresentHeSheIt"
        case we = "subjonctifPresentWe"
        case youAll = "subjonctifPresentYouAll"
        case they = "subjonctifPresentThey"
    }
    
}


struct FrenchVerbSubjonctifPasse : Codable {
    
    var i : String?
    var you : String?
    var heSheIt : String?
    var we : String?
    var youAll : String?
    var they : String?
    
    private enum CodingKeys: String, CodingKey {
        case i = "subjonctifPasseI"
        case you = "subjonctifPasseYou"
        case heSheIt = "subjonctifPasseHeSheIt"
        case we = "subjonctifPasseWe"
        case youAll = "subjonctifPasseYouAll"
        case they = "subjonctifPasseThey"
    }
    
}


struct FrenchVerbSubjonctifImparfait : Codable {
    
    var i : String?
    var you : String?
    var heSheIt : String?
    var we : String?
    var youAll : String?
    var they : String?
    
    private enum CodingKeys: String, CodingKey {
        case i = "subjonctifImparfaitI"
        case you = "subjonctifImparfaitYou"
        case heSheIt = "subjonctifImparfaitHeSheIt"
        case we = "subjonctifImparfaitWe"
        case youAll = "subjonctifImparfaitYouAll"
        case they = "subjonctifImparfaitThey"
    }
    
}


struct FrenchVerbSubjonctifPlusQueParfait : Codable {
    
    var i : String?
    var you : String?
    var heSheIt : String?
    var we : String?
    var youAll : String?
    var they : String?
    
    private enum CodingKeys: String, CodingKey {
        case i = "subjonctifPlusQueParfaitI"
        case you = "subjonctifPlusQueParfaitYou"
        case heSheIt = "subjonctifPlusQueParfaitHeSheIt"
        case we = "subjonctifPlusQueParfaitWe"
        case youAll = "subjonctifPlusQueParfaitYouAll"
        case they = "subjonctifPlusQueParfaitThey"
    }
    
}
