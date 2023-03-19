//
//  Keynote.swift
//  KFormatScreening
//
//  Created by Gavin Kwon on 3/18/23.
//

import Foundation

struct Keynote: Decodable, Identifiable {
    
    var id: Int
    var keynotePerson: String
    var keynoteTitle: String
    var keynoteImage: String
    var keynoteCompany: String
    var keynotePosition: String
    var keynoteContact: String
    var keynoteDescription: String
    var keynoteColor: String
    var keynoteUrl: String
    var keynoteVideourl: String
    var keynoteLogo: String

}
