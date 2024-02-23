//
//  FrenchVerbModel.swift
//  FrenchVerbConjugation
//
//  Created by Daniel Carvalho on 15/11/23.
//

import Foundation


struct FrenchVerb : Codable {
    
    var verb : String?
    var fullDescription : String?
    var word : String?
    var wordConjugateRule : String?
    var wordConjugateWhichVerbModel : String?
    var wordConjugateWithWhichVerb : String?
    var wordVerbGroup : String?
    var wordVerbType : String?
    
    var conditionnel : FrenchVerbConditionnel?
    var imperatif : FrenchVerbImperatif?
    var indicatif : FrenchVerbIndicatif?
    
    var infinitive : FrenchVerbInfinitive?
    var participe : FrenchVerbParticipe?
    
    var subjonctif : FrenchVerbSubjonctif?
    
    
    static func decode( json : [String:Any] ) -> FrenchVerb? {
        
        let decoder = JSONDecoder()
        do{
            let data = try JSONSerialization.data(withJSONObject: json, options: .prettyPrinted)
            let object = try decoder.decode(FrenchVerb.self, from: data)
            return object
        } catch {
        }
        return nil
    }
    
    static func decodeRandom( json : [String] ) -> [String]? {
        
        let decoder = JSONDecoder()
        do{
            let data = try JSONSerialization.data(withJSONObject: json, options: .prettyPrinted)
            let object = try decoder.decode([String].self, from: data)
            return object
        } catch {
        }
        return nil
    }
}
