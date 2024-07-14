//
//  Episode.swift
//  BBQuotes
//
//  Created by sourav das on 14/07/24.
//

import Foundation

struct Episode : Decodable {
    
    let episode : Int
    let title: String
    let synopsis : String
    let writtenBy : String
    let directedBy : String
    let airDate : String
    
    /// objective: We have to convert the episode number from 101 to season 1 episode 1
    
    
    var seasonAndEpisde : String {
        
        var episodeString = String(episode)
        var season = episodeString.removeFirst() // it contains 1
        
        if episodeString.first == "0" {
            episodeString = String(episodeString.removeLast())
        }
        return "Season \(season) and Episode \(episodeString)"
    }
    
}
