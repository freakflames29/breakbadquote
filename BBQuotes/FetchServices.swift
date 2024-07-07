//
//  FetchQuotes.swift
//  BBQuotes
//
//  Created by sourav das on 07/07/24.
//

import Foundation

struct FetchServices {
    enum FetchErrors : Error{
        case badResponse
    }
    
    let baseURL = URL(string: "https://breaking-bad-api-six.vercel.app/api")!
    
    func fetchData(from show: String) async throws -> QuoteModel {
        
        /// build fetch URL
        let quoteURL = baseURL.appending(path: "quotes/random") /// building the quote url xyz.com/api/quotes/random
        let fetchURL = quoteURL.appending(queryItems: [URLQueryItem(name: "production", value: show)]) /// building the actual URL xyz.com/api/quotes/random?production=Breaking+Bad ---> URLQueryItem handles with spaces and spaces
        
        
        
        /// fetch Data
        let (data,urlResponse) = try await URLSession.shared.data(from: fetchURL)
        
        
        
        /// handle response
        guard let response = urlResponse as? HTTPURLResponse , response.statusCode == 200 else {
            throw FetchErrors.badResponse
        }
        
        /// decode data
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        let decodedData = try decoder.decode(QuoteModel.self, from: data)
        
        
        /// Return QuoteModel data
        return decodedData
    }
    
    func fetchCharecter(_ name: String) async throws -> CharectorModel {
        
        let charecterURL = baseURL.appending(path: "characters")
        let fetchURL = charecterURL.appending(queryItems: [URLQueryItem(name: "name", value: name) ])
        
        let (data,URLResponse) = try await URLSession.shared.data(from: fetchURL)
        
        guard let response = URLResponse  as? HTTPURLResponse, response.statusCode == 200 else{
            throw FetchErrors.badResponse
            
            
        }
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        /// In the API the single charector is returned as a string of data so we have to use a list of CharecterModel
        let decodedDatas = try decoder.decode([CharectorModel].self, from: data)
        
        return decodedDatas[0]
    }
    
    func fetchDeath(for char :String) async throws -> DeathModel? {
        /// gather the url
        let fetchURL = baseURL.appending(path: "deaths")
        
        // fetch data
        
        let (data,urlResponse ) = try await URLSession.shared.data(from: fetchURL)
        
        // handling the response
        guard let response = urlResponse as? HTTPURLResponse , response.statusCode == 200 else {
            throw FetchErrors.badResponse
        }
        
        //decoding the data
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy  = .convertFromSnakeCase
        
        let decodedDeaths = try decoder.decode([DeathModel].self, from: data)
        
        /// as the death is stand alone api it returns all the death despite of death with out specific query of charecotr we are checking if the charector is present in the death or not if present return the death or else return nil
        
        for death in decodedDeaths {
            if death.character == char {
                return death
            }
        }
        
        return nil
        
        
        
        
    }
    
}
