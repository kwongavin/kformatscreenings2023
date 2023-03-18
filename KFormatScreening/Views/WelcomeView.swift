//
//  welcomeView.swift
//  KFormatScreening
//
//  Created by Gavin Kwon on 3/16/23.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                
                Image("logo_main")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(10)
                
                Text("Welcome to K-Format Showcase at\nLA Screenings 2023!")
                    .font(Font.custom("Avenir Heavy", size: 20))
                    .padding(.leading, 5)
                    .padding(.vertical, 10)
                
                Text("From May 18 to May 20, “2022 K-Format Showcase at LA Screening” and “Business Counseling” were held to enter the U.S. market for Korean broadcasting formats.\n\nCurrently, director Bong Joon-ho’s various works have recently been increasingly interested in Korean cultural contents from around the world due to Parasite and actress Yoon Yeo-jung’s Minari In the past, however, there were no various ways to approach it.\n\nAll the more important is the actions and policies at this time. That’s why the Korea Creative Content Agency prepared this showcase.\n\nThis is not the first time this year. This year, offline events will be held three years after the pandemic.\n\nThere are already many successful contents after the Korea Creative Content Agency introduced them to the U.S. or overseas markets in the past and remade them in each country, especially MBC’s “King of Mask Singer.” It has already been a huge success in the United States, and very famous pop stars, actors, and athletes have come out to show various pleasures to viewers.")
                    .font(Font.custom("Avenir", size: 17))
                    .padding(5)
                
                Image("logo_main")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(10)
                    .padding(.top, 20)
            }
            .padding()
        }
    }
}

struct welcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
