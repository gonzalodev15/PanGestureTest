//
//  MoviesApi.swift
//  KatchAppTest
//
//  Created by Christian Gonzalo on 10/16/19.
//  Copyright © 2019 Christian Gonzalo. All rights reserved.
//

import Foundation

class MoviesApi {
    
    static let apiKey = "api_key=df35f7019fac812eb9a62bc1de110530"
    
    static let moviesBaseUrl = "https://api.themoviedb.org/3"
    static let digimonsUrl = "https://digimon-api.herokuapp.com/api/digimon"
    
    public static func movieUrl(movieId: Int) -> String{
        let url = "\(moviesBaseUrl)/movie/\(movieId)?\(apiKey)"
        return url
    }
    
    
    /*
    public static func userProfileUrl(userid: Int) -> String {
        return "\(baseUrl)/veterinaries/\(userid)"
    }
    
    public static var userLogin : String {
        return "\(baseUrl)/login"
    }
    
    public static func finishAppointmentUrl(appointmentId: Int)-> String {
        return "\(baseUrl)/appointments/\(appointmentId)/history"
    }
    
    public static func updateProfile(userId: Int) -> String {
        return "\(baseUrl)/veterinaries/\(userId)"
    }*/
    
}
