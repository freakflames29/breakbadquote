//
//  CharectorModel.swift
//  BBQuotes
//
//  Created by sourav das on 07/07/24.
//

import Foundation

struct CharectorModel : Decodable{
    let name  : String
    let birthday : String
    let occupations : [String]
    let images :  [URL]
    let aliases : [String]
    let status :  String
    let portrayedBy : String
    var death : DeathModel?
    
}
