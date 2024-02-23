//
//  File.swift
//  FrenchVerbConjugation
//
//  Created by Daniel Carvalho on 15/11/23.
//

import Foundation


struct FrenchVerbIndicatif : Codable {
    
    var present : FrenchVerbIndicatifPresent?
    var passeSimple : FrenchVerbIndicatifPasseSimple?
    var imparfait : FrenchVerbIndicatifImparfait?
    var passeCompose : FrencVerbIndicatifPasseCompose?
    var futurSimple : FrencVerbIndicatifFuturSimple?
    var passeAnterieur : FrencVerbIndicatifPasseAnterieur?
    var plusQueParfait : FrencVerbIndicatifPlusQueParfait?
    var futurAnterieur : FrencVerbIndicatifFuturAnterieur?
    
}
 
struct FrenchVerbIndicatifPresent : Codable {
    
    var i : String?
    var you : String?
    var heSheIt : String?
    var we : String?
    var youAll : String?
    var they : String?
    
    private enum CodingKeys: String, CodingKey {
        case i = "indicatifPresentI"
        case you = "indicatifPresentYou"
        case heSheIt = "indicatifPresentHeSheIt"
        case we = "indicatifPresentWe"
        case youAll = "indicatifPresentYouAll"
        case they = "indicatifPresentThey"
    }
    
}

struct FrenchVerbIndicatifPasseSimple : Codable {
    
    var i : String?
    var you : String?
    var heSheIt : String?
    var we : String?
    var youAll : String?
    var they : String?
    
    private enum CodingKeys: String, CodingKey {
        case i = "indicatifPasseSimpleI"
        case you = "indicatifPasseSimpleYou"
        case heSheIt = "indicatifPasseSimpleHeSheIt"
        case we = "indicatifPasseSimpleWe"
        case youAll = "indicatifPasseSimpleYouAll"
        case they = "indicatifPasseSimpleThey"
    }
    
}

struct FrenchVerbIndicatifImparfait : Codable {
    
    var i : String?
    var you : String?
    var heSheIt : String?
    var we : String?
    var youAll : String?
    var they : String?
    
    private enum CodingKeys: String, CodingKey {
        case i = "indicatifImparfaitI"
        case you = "indicatifImparfaitYou"
        case heSheIt = "indicatifImparfaitHeSheIt"
        case we = "indicatifImparfaitWe"
        case youAll = "indicatifImparfaitYouAll"
        case they = "indicatifImparfaitThey"
    }
    
}


struct FrencVerbIndicatifPasseCompose : Codable {
    
    var i : String?
    var you : String?
    var heSheIt : String?
    var we : String?
    var youAll : String?
    var they : String?
    
    private enum CodingKeys: String, CodingKey {
        case i = "indicatifPasseComposeI"
        case you = "indicatifPasseComposeYou"
        case heSheIt = "indicatifPasseComposeHeSheIt"
        case we = "indicatifPasseComposeWe"
        case youAll = "indicatifPasseComposeYouAll"
        case they = "indicatifPasseComposeThey"
    }
    
}


struct FrencVerbIndicatifFuturSimple : Codable {
    
    var i : String?
    var you : String?
    var heSheIt : String?
    var we : String?
    var youAll : String?
    var they : String?
    
    private enum CodingKeys: String, CodingKey {
        case i = "indicatifFuturSimpleI"
        case you = "indicatifFuturSimpleYou"
        case heSheIt = "indicatifFuturSimpleHeSheIt"
        case we = "indicatifFuturSimpleWe"
        case youAll = "indicatifFuturSimpleYouAll"
        case they = "indicatifFuturSimpleThey"
    }
    
}


struct FrencVerbIndicatifPasseAnterieur : Codable {
    
    var i : String?
    var you : String?
    var heSheIt : String?
    var we : String?
    var youAll : String?
    var they : String?
    
    private enum CodingKeys: String, CodingKey {
        case i = "indicatifPasseAnterieurI"
        case you = "indicatifPasseAnterieurYou"
        case heSheIt = "indicatifPasseAnterieurHeSheIt"
        case we = "indicatifPasseAnterieurWe"
        case youAll = "indicatifPasseAnterieurYouAll"
        case they = "indicatifPasseAnterieurThey"
    }
    
}


struct FrencVerbIndicatifPlusQueParfait : Codable {
    
    var i : String?
    var you : String?
    var heSheIt : String?
    var we : String?
    var youAll : String?
    var they : String?
    
    private enum CodingKeys: String, CodingKey {
        case i = "indicatifPlusQueParfaitI"
        case you = "indicatifPlusQueParfaitYou"
        case heSheIt = "indicatifPlusQueParfaitHeSheIt"
        case we = "indicatifPlusQueParfaitWe"
        case youAll = "indicatifPlusQueParfaitYouAll"
        case they = "indicatifPlusQueParfaitThey"
    }
    
}



struct FrencVerbIndicatifFuturAnterieur : Codable {
    
    var i : String?
    var you : String?
    var heSheIt : String?
    var we : String?
    var youAll : String?
    var they : String?
    
    private enum CodingKeys: String, CodingKey {
        case i = "indicatifFuturAnterieurI"
        case you = "indicatifFuturAnterieurYou"
        case heSheIt = "indicatifFuturAnterieurHeSheIt"
        case we = "indicatifFuturAnterieurWe"
        case youAll = "indicatifFuturAnterieurYouAll"
        case they = "indicatifFuturAnterieurThey"
    }
    
}
