import Foundation
import UIKit



class FrenchVerbAPI {
    
    static let baseURL = "https://french-verbs-fall-2023-app-ramym.ondigitalocean.app/"

    static func getVerb( verb : String,
                         successHandler: @escaping ( _ verb : FrenchVerb ) -> Void,
                         failHandler : @escaping (_ httpStatusCode : Int, _ errorMessage: String) -> Void) {
        
        let endPoint = "v0/verbs"
        
        let header : [String:String] = ["x-access-token": Context.loggedUserToken!]
        
        let payload : [String:Any] = ["verb": verb]
        
        
        API.call(baseURL: baseURL, endPoint: endPoint, method: "POST", header: header, payload: payload) { httpStatusCode, response in
            
            if let content = response["verb"] as? [String:Any]{
                if let verb = FrenchVerb.decode(json: content){
                    successHandler(verb)
                    return
                }
            }
            failHandler(httpStatusCode, "Cannot decode response!")
            
        } failHandler: { httpStatusCode, errorMessage in
            
            failHandler(httpStatusCode, errorMessage)
            
        }
        
    }
        
    
    static func signIn( email : String, password : String,
                        successHandler: @escaping ( _ token : String , _ name : String) -> Void,
                         failHandler : @escaping (_ httpStatusCode : Int, _ errorMessage: String) -> Void) {
        
        let endPoint = "v0/users/login"
        
        let header : [String:String] = [:]
        
        let payload : [String:Any] = ["email": email, "password" : password]
        
        
        API.call(baseURL: baseURL, endPoint: endPoint, method: "POST", header: header, payload: payload) { httpStatusCode, response in

            if let token = response["token"] as? String {
                if let userName = response["logged_user"] as? [String: Any], let name = userName["name"] as? String {
                    successHandler(token, name)
                    return
                }
            }
            failHandler(httpStatusCode, "Cannot decode response!")
            
        } failHandler: { httpStatusCode, errorMessage in
            
            failHandler(httpStatusCode, errorMessage)
            
        }
        
    }
    
    static func signUp(email: String, name: String, password: String,
                       successHandler: @escaping (_ userId: String) -> Void,
                       failHandler: @escaping (_ httpStatusCode: Int, _ errorMessage: String) -> Void) {
        
        let endPoint = "v0/users/"
        
        let header : [String:String] = [:]

        let payload: [String: Any] = ["email": email, "name": name, "password": password]

        API.call(baseURL: baseURL, endPoint: endPoint, method: "POST", header: header, payload: payload) { httpStatusCode, response in

            if let userId = response["id"] as? String {
                successHandler(userId)
                return
            }
            failHandler(httpStatusCode, "Cannot decode response!")

        } failHandler: { httpStatusCode, errorMessage in

            failHandler(httpStatusCode, errorMessage)

        }
    }
    static func getRandomVerbs(number : Int,
                           successHandler : @escaping ( _ verb : [String]) -> Void,
                            failHandler : @escaping (_ httpStatusCode : Int, _ errorMessage : String) -> Void) -> Void {
        
        let endPoint = "v0/verbs/random"
        
        let header : [String:String] = ["x-access-token" : Context.loggedUserToken!]
        
        let payload : [String:Any] = ["quantity": number]
        
        API.call(baseURL: baseURL, endPoint: endPoint, method : "POST", header: header, payload: payload) { httpStatusCode, response in
            if let content = response["verbs"] as? [String]{
                if let verbs = FrenchVerb.decodeRandom(json: content){
                    successHandler(verbs)
                    return
                }
            }
            failHandler(httpStatusCode, "Cannot decode response!")
        } failHandler: { httpStatusCode, errorMessage in
            failHandler(httpStatusCode, errorMessage)
        }

    }
    
}
