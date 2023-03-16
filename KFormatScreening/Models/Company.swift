//
//  Company.swift
//  KFormatScreening
//
//  Created by Gavin Kwon on 3/16/23.
//

import Foundation

struct Company: Decodable, Identifiable {
    
    var id: Int
    var companyName: String
    var companyPerson: String
    var companyPosition: String
    var companyDescription: String
    var companyEmail: String
    var companyPhone: String
    var companyUrl: String
    var companyLogo: String
    var companyShow: [Show]
    
}

struct Show: Decodable, Identifiable {
    
    var id: Int
    var showType: String
    var showName: String
    var showYear: String
    var showGenre: String
    var showDescription: String
    var showTime: Int
    var showEpisodes: Int
    var showUrl: String
    
}
