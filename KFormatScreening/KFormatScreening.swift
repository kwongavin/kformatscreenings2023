//
//  KFormatScreeningApp.swift
//  KFormatScreening
//
//  Created by Gavin Kwon on 3/16/23.
//

import SwiftUI

@main
struct KFormatScreening: App {
    var body: some Scene {
        WindowGroup {
            MainTabView()
                .environmentObject(CompanyModel())
                .environmentObject(KeynoteModel())
        }
    }
}
