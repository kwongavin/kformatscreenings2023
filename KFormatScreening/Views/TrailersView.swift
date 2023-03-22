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
    @State var showTypeIndex = 0
    
    @Environment(\.colorScheme) var colorScheme
    
    init() {
        if let customFont = UIFont(name: "Avenir Heavy", size: 14) {
            let attributes: [NSAttributedString.Key:Any] = [
                .font : customFont
            ]
            UISegmentedControl.appearance().setTitleTextAttributes(attributes, for: .selected)
        }
        
        if let customFont2 = UIFont(name: "Avenir Light", size: 14) {
            let attributes2: [NSAttributedString.Key:Any] = [
                .font : customFont2
            ]
            UISegmentedControl.appearance().setTitleTextAttributes(attributes2, for: .normal)
        }
    }
    
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
                
                Picker("", selection: $showTypeIndex) {
                    Text("Scripted").tag(0)
                    Text("Non-Scripted").tag(1)
                }
                .font(Font.custom("Avenir Black", size: 20))
                .pickerStyle(SegmentedPickerStyle())
                .padding(.top, -10)
                .padding(.bottom, 5)
                
                ScrollView(showsIndicators: false) {
                    
                    ForEach(companyShows.filter({ show in
                        switch showTypeIndex {
                        case 0:
                            return show.showType == "Scripted"
                        case 1:
                            return show.showType == "Non-Scripted"
                        default:
                            return false
                        }
                    }).shuffled()) { show in
                        
                        NavigationLink(destination: TrailersVideoView(enteredShowType: show.showType, enteredShowCompany: show.showCompany, enteredShowPerson: show.showPerson, enteredShowPosition: show.showPosition, enteredShowEmail: show.showEmail, enteredShowPhone: show.showPhone, enteredShowName: show.showName, enteredShowImage: show.showImage, enteredShowLogo: show.showLogo, enteredShowColor: show.showColor, enteredShowYear: show.showYear, enteredShowGenre: show.showGenre, enteredShowDescription: show.showDescription, enteredShowTime: show.showTime, enteredShowEpisodes: show.showEpisodes, enteredShowUrl: show.showUrl), label: {
                            
                            TrailersListView(enteredShowType: show.showType, enteredShowName: show.showName, enteredShowImage: show.showImage, enteredShowLogo: show.showLogo, enteredShowColor: show.showColor, enteredShowYear: show.showYear, enteredShowGenre: show.showGenre, enteredShowTime: show.showTime, enteredShowEpisodes: show.showEpisodes, enteredShowUrl: show.showUrl)
                                .multilineTextAlignment(.leading)
                                .padding(.bottom, 25)
                        })
                        .accentColor(colorScheme == .dark ? .white: .black)
                        
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
