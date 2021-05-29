//
//  MoviesModel.swift.swift
//  MoviesList
//
//  Created by GWL-29 on 29/05/21.
//

import Foundation


struct MoviesModel: Codable {
    let title: String?
    let description: String?
    let voteAverage : String?
    let imageUrl : String?
    let releaseDate : String?
    let voteCount : String?
 
    enum CodingKeys: String, CodingKey {
        case title = "title"
        case voteAverage = "vote_average"
        case description = "overview"
        case imageUrl = "poster_path"
        case releaseDate = "release_date"
        case voteCount = "vote_count"
        
    }
}


