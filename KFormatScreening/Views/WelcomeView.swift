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
                
                Group {
                    Rectangle()
                        .foregroundColor(Color("color_event"))
                        .frame(height: 7)
                        .cornerRadius(10)
                    
                    Text("Welcome to 2023 K-Broadcasting\nat LA Screenings!")
                        .font(Font.custom("Avenir Heavy", size: 21))
                        .padding(.leading, 5)
                        .padding(.vertical, 15)
                    
                    Rectangle()
                        .foregroundColor(Color("color_event"))
                        .frame(height: 4)
                        .cornerRadius(10)
                        .padding(.bottom, 15)
                }
                
                ZStack(alignment: .leading) {
                    Rectangle()
                        .foregroundColor(.purple)
                        .cornerRadius(18)
                        .opacity(0.1)
                    VStack(alignment: .leading) {
                        HStack {
                            Text("Virtual Showcase")
                                .font(Font.custom("Avenir Heavy", size: 20))
                                .padding(.vertical)
                            Text("|  5.8 - 5.19")
                                .font(Font.custom("Avenir", size: 18))
                        }
                        .padding(.top, 10)
                        
                        HStack {
                            Text("In-Person Meeting")
                                .font(Font.custom("Avenir Heavy", size: 20))
                            Text("|  5.17 - 5.19")
                                .font(Font.custom("Avenir", size: 18))
                        }
                        Text("Fairmont Century Plaza")
                            .font(Font.custom("Avenir", size: 17))
                            .padding(.bottom, 20)
                    }
                    .padding(.leading, 15)
                }
                
                Text("\n2023 K-BROADCASTING at LA Screenings is an exciting showcase of the latest and most popular Korean TV shows, organized by the Ministry of Culture, Sports and Tourism and the Korea Creative Content Agency, featuring both scripted and non-scripted formats from major media companies in Korea.\n\nHere, you will find a curated selection of trailers, showcasing their latest and most exciting TV shows. Take a moment to explore each company's introduction and learn more about their programs!\n\nInterested in doing business with them? Simply use the contact information provided to reach out and start a conversation. We hope you enjoy this immersive experience and discover the next must-watch show.\n")
                    .font(Font.custom("Avenir", size: 17))
                    .padding(5)
                
                Rectangle()
                    .foregroundColor(Color("color_event"))
                    .frame(height: 4)
                    .cornerRadius(10)
                    .padding(.bottom, 20)
                
                ZStack {
                    Rectangle()
                        .foregroundColor(.purple)
                        .cornerRadius(18)
                        .opacity(0.1)
                    Text("\nThis showcase event is being held both online and in-person. You can check out our online showcase, featuring trailers and introductions, from May 8 to May 19 on the website.\n\nThen, you will be able to request for an online meeting OR an in-person meeting during the 2023 LA screenings from May 17 to May 19 at Fairmount Century Plaza. We strongly encourage you to register on this website and reserve a meeting prior to the event since meeting spots tend to fill up fast.\n")
                        .font(Font.custom("Avenir", size: 17))
                    .padding(5)
                    .padding(.leading, 5)
                }
                MapView() 
                    .frame(height: 200)
                    .cornerRadius(18)
                    .padding(.top, 15)
                
                Rectangle()
                    .foregroundColor(Color("color_event"))
                    .frame(height: 7)
                    .cornerRadius(10)
                    .padding(.top, 20)
                
                HStack {
                    Text("For more information:")
                        .font(Font.custom("Avenir", size: 17))
                    Link("kocca_usa@kocca.kr", destination: URL(string: "mailto:kocca_usa@kocca.kr")!)
                        .font(Font.custom("Avenir Roman", size: 17))
                        .accentColor(Color("color_event"))
                }
                .padding(.leading, 5)
                .padding(.vertical)
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
