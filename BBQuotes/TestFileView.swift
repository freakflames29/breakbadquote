//
//  TestFileView.swift
//  BBQuotes
//
//  Created by sourav das on 08/07/24.
//

import Foundation

class TestController  {
    var quoteDecodedData : [QuoteModel] = []
    
    init(){
        decodeData()
        
    }
    
    func decodeData(){
        if let url = Bundle.main.url(forResource: "samplequote", withExtension: "json ") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                
                quoteDecodedData = try decoder.decode([QuoteModel].self, from: data)
                
                
            }catch{
                print("Eror decoding the data \(error)")
            }
        
        }

        
        
        
    }
    
}
