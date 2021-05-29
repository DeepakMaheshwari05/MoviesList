//
//  MoviesListViewModel.swift
//  MoviesList
//
//  Created by GWL-29 on 29/05/21.
//

import Foundation

class MoviesListViewModel {
    
    // Variables
    var arrList = Bindable([MoviesListCellViewModel]())
        
  
}

extension MoviesListViewModel {
    // Fetch Users
    func fetchList() {
        if let url = Bundle.main.url(forResource: "movies", withExtension: "json") {
            do {
                let jsonData = try Data(contentsOf: url)
                let json = try JSONSerialization.jsonObject(with: jsonData) as! [[String: Any]]
                print(json)
                var arrObj = [MoviesModel]()
                for jsonObj in json {
                    var obj = MoviesModel(title: jsonObj["title"] as? String, description: jsonObj["overview"] as? String, voteAverage: "\(jsonObj["vote_average"])" , imageUrl: jsonObj["poster_path"] as? String, releaseDate: jsonObj["release_date"] as? String, voteCount: "\(jsonObj["vote_count"])")
                    arrObj.append(obj)
                }
                self.arrList.value = arrObj.compactMap({ MoviesListCellViewModel.init(objUserModel: $0) })
                
            } catch {
                // handle error
            }
        }
    }
}
