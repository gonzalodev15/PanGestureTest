//
//  Movie.swift
//  KatchAppTest
//
//  Created by Christian Gonzalo on 10/16/19.
//  Copyright © 2019 Christian Gonzalo. All rights reserved.
//

import Foundation
import SwiftyJSON

class Movie{
    var name: String
    var overview: String
    var poster: String
    
    init(name:String, overview: String, poster: String){
        self.name = name
        self.overview = overview
        self.poster = poster

    }
    
    convenience init(){
        self.init(name: "", overview: "", poster: "")
    }
    
    convenience init(jsonMovie: JSON) {
        self.init(
            name: jsonMovie["original_title"].stringValue,
            overview: jsonMovie["overview"].stringValue,
            poster: jsonMovie["poster_path"].stringValue
        )
    }
    
    static func buildAll(from jsonMovies: [JSON]) -> [Movie]{
        var movies: [Movie] = []
        let count = jsonMovies.count
        for i in 0 ..< count {
            movies.append(Movie(jsonMovie: JSON(jsonMovies[i])))
        }
        return movies
    }
}
