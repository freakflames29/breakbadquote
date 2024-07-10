//
//  ViewModel.swift
//  BBQuotes
//
//  Created by sourav das on 08/07/24.
//

import Foundation

@Observable
class ViewModel{
    enum FetchStatus {
        case notStarted
        case fetching
        case success
        case failed(error: Error)
    }
    
    private(set) var status : FetchStatus = .notStarted
    private let fetcher = FetchServices()
    
    var quote: QuoteModel
    var charecters : CharectorModel
    
    init()
    {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        
        let data = try! Data(contentsOf: Bundle.main.url(forResource: "samplequote", withExtension: "json")!)
        
        quote = try! decoder.decode(QuoteModel.self, from: data)
        
        
        
        let Cdata = try! Data(contentsOf: Bundle.main.url(forResource: "samplecharacter", withExtension: "json")!)
        
        charecters = try! decoder.decode(CharectorModel.self, from: Cdata)
        
    }
    
    func fetchData(for show: String) async {
        self.status = .fetching
        do {
            quote = try await fetcher.fetchQuote(from: show)
            
            charecters = try await fetcher.fetchCharecter(quote.character)
            
            charecters.death = try await fetcher.fetchDeath(for: charecters.name)
            
            self.status = .success
            
        }catch{
            self.status = .failed(error: error)
        }
    }
    
}
