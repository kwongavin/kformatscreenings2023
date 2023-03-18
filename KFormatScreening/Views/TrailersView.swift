//
//  trailersView.swift
//  KFormatScreening
//
//  Created by Gavin Kwon on 3/16/23.
//

import SwiftUI

struct TrailersView: View {
    
    @EnvironmentObject var company: CompanyModel
    @State private var companyShows: [Show] = []
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Trailers")
                    .font(Font.custom("Avenir Heavy", size: 24))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .onAppear {
                        loadCompanyShows()
                    }
                
                ScrollView {
                    
                    ForEach(companyShows.shuffled()) { show in
                        
                        NavigationLink(destination: TrailersVideoView(enteredShowType: show.showType, enteredShowName: show.showName, enteredShowImage: show.showImage, enteredShowLogo: show.showLogo, enteredShowColor: show.showColor, enteredShowYear: show.showYear, enteredShowGenre: show.showGenre, enteredShowDescription: show.showDescription, enteredShowTime: show.showTime, enteredShowEpisodes: show.showEpisodes, enteredShowUrl: show.showUrl), label: {
                            
                            TrailersListView(enteredShowType: show.showType, enteredShowName: show.showName, enteredShowImage: show.showImage, enteredShowLogo: show.showLogo, enteredShowColor: show.showColor, enteredShowYear: show.showYear, enteredShowGenre: show.showGenre, enteredShowTime: show.showTime, enteredShowEpisodes: show.showEpisodes, enteredShowUrl: show.showUrl)
                                .multilineTextAlignment(.leading)
                                .padding(.bottom, 25)
                        })
                        .accentColor(.black)
                        
                    }
                    
                }
                //            .id(companyShows)
            }
            .padding()
        }
    }
    
    func loadCompanyShows() {
        let allShows = company.companies.flatMap { $0.companyShow }
        companyShows = allShows
    }
    
}

struct PrailersView_Previews: PreviewProvider {
    static var previews: some View {
        TrailersView()
            .environmentObject(CompanyModel())
    }
}
