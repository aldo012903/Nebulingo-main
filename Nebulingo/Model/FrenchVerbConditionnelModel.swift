//
//  FrenchVerbConditionnelModel.swift
//  FrenchVerbConjugation
//
//  Created by Daniel Carvalho on 15/11/23.
//

import Foundation


struct FrenchVerbConditionnel : Codable {
    
    var present : FrenchVerbConditionnelPresent?
    var passe1reForme : FrenchVerbConditionnelpasse1reForme?
    var passe2eForme : FrenchVerbConditionnelpasse2eForme?
    
}

struct FrenchVerbConditionnelPresent : Codable {
    
    var i : String?
    var you : String?
    var heSheIt : String?
    var we : String?
    var youAll : String?
    var they : String?
    
    private enum CodingKeys: String, CodingKey {
        case i = "conditionnelPresentI"
        case you = "conditionnelPresentYou"
        case heSheIt = "conditionnelPresentHeSheIt"
        case we = "conditionnelPresentWe"
        case youAll = "conditionnelPresentYouAll"
        case they = "conditionnelPresentThey"
    }
    
}

struct FrenchVerbConditionnelpasse1reForme : Codable {
    
    var i : String?
    var you : String?
    var heSheIt : String?
    var we : String?
    var youAll : String?
    var they : String?
    
    private enum CodingKeys: String, CodingKey {
        case i = "conditionnelPasse1reFormeI"
        case you = "conditionnelPasse1reFormeYou"
        case heSheIt = "conditionnelPasse1reFormeHeSheIt"
        case we = "conditionnelPasse1reFormeWe"
        case youAll = "conditionnelPasse1reFormeYouAll"
        case they = "conditionnelPasse1reFormeThey"
    }
    
}

struct FrenchVerbConditionnelpasse2eForme : Codable {
    
    var i : String?
    var you : String?
    var heSheIt : String?
    var we : String?
    var youAll : String?
    var they : String?
    
    private enum CodingKeys: String, CodingKey {
        case i = "conditionnelPasse2eFormeI"
        case you = "conditionnelPasse2eFormeYou"
        case heSheIt = "conditionnelPasse2eFormeHeSheIt"
        case we = "conditionnelPasse2eFormeWe"
        case youAll = "conditionnelPasse2eFormeYouAll"
        case they = "conditionnelPasse2eFormeThey"
    }
    
}

