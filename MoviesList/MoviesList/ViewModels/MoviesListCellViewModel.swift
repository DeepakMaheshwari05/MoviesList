//
//  MoviesListCellViewModel.swift
//  MoviesList
//
//  Created by GWL-29 on 29/05/21.
//

import Foundation

protocol MoviesListCellViewModelProtocol {
    var objMoviesModel: MoviesModel { get }
    var title: String { get }
    var description: String { get }
    var voteAverage: String { get }
    var imageUrl: String { get }
    var releaseDate: String { get }
    var voteCount: String { get }
    
}

final class MoviesListCellViewModel: MoviesListCellViewModelProtocol {
    let objMoviesModel: MoviesModel
    let title: String
    let description: String
    var voteAverage: String
    var imageUrl: String
    let releaseDate: String
    let voteCount: String
    
    init(objUserModel: MoviesModel) {
        self.objMoviesModel = objUserModel
        self.title = objUserModel.title ?? ""
        self.description = objUserModel.description ?? ""
        self.voteAverage = objUserModel.voteAverage ?? ""
        self.imageUrl =  imageBaseurl + (objUserModel.imageUrl  ?? "")
        self.releaseDate = objUserModel.releaseDate ?? ""
        self.voteCount = objUserModel.voteCount ?? ""
        
    }
    
}
