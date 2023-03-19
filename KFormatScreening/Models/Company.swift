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
    var companyColor: String
    var companyUrl: String
    var companyPTurl: String
    var companyLogo: String
    var companyShow: [Show]
    
}

struct Show: Decodable, Identifiable, Hashable {
    
    var id: Int
    var showType: String
    var showCompany: String
    var showPerson: String
    var showPosition: String
    var showEmail: String
    var showPhone: String
    var showName: String
    var showImage: String
    var showLogo: String
    var showColor: String
    var showYear: String
    var showGenre: String
    var showDescription: String
    var showTime: String
    var showEpisodes: String
    var showUrl: String
    
}
