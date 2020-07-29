//
//  PlaceLocationNetworking.swift
//  life tracking
//
//  Created by Rodrigo Santos on 23/07/20.
//  Copyright © 2020 Rodrigo Santos. All rights reserved.
//


import Foundation

let CLIENT_ID: String = "eRsDwGfRF4jBKB6l"
let SECRET_KEY: String = "9b4a0fa2e7974e4dbe0225a351df3aec"
let GRANT_TOKEN: String = "client_credentials"
let AUTH_KEY: String = "Basic \((CLIENT_ID + ":" + SECRET_KEY).data(using: .utf8)!.base64EncodedData())"



class PlaceLocationNetworking{
    
    
    static let shared = PlaceLocationNetworking()
    
    func AuthenticationAndRefreshToken(completion: @escaping (PlaceLocationAuth) -> ()) {
        
        let requestHeaders: [String:String] = ["Authorization" : AUTH_KEY,
                                               "Content-Type" : "application/x-www-form-urlencoded"]
        
        var requestBodyComponents = URLComponents()
        
        requestBodyComponents.queryItems = [URLQueryItem(name: "grant_type", value: GRANT_TOKEN),
                                            URLQueryItem(name: "client_id", value: CLIENT_ID),
                                            URLQueryItem(name: "client_secret", value: SECRET_KEY)]
        
        var request = URLRequest(url: URL(string: "https://www.arcgis.com/sharing/rest/oauth2/token")!)
        
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = requestHeaders
        request.httpBody = requestBodyComponents.query?.data(using: .utf8)
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            guard let data = data else { return }
            
            do {
                let auth = try JSONDecoder().decode(PlaceLocationAuth.self, from: data)
                
                completion(auth)
            } catch {
                print(" Error ")
            }
            
        }.resume()
        
    }
    
    func FindCitiesByName(city: String, token: String, completion: @escaping (PlaceLocation) -> ()) {
        
        let requestHeaders: [String:String] = ["Authorization" : "Bearer \(token)"]
        
        var req = URLComponents(string: "https://geocode.arcgis.com/arcgis/rest/services/World/GeocodeServer/findAddressCandidates")
        
        req?.queryItems = [URLQueryItem(name: "f", value: "json"),
                                            URLQueryItem(name: "singleLine", value: city),
                                            URLQueryItem(name: "outFields", value: "Match_addr,Addr_type, Place_addr, PlaceName"),
                                            URLQueryItem(name: "maxLocations", value: "1")]
        
        
        
        var request = URLRequest(url: (req?.url)!)
        
        request.allHTTPHeaderFields = requestHeaders
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            guard let data = data else { return }
            
            do {
                let data = try JSONDecoder().decode(PlaceLocation.self, from: data)
                completion(data)
            } catch {
                print(" -- Error -- ")
            }
            
        }.resume()
    }
    
}
