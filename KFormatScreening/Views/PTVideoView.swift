//
//  ShowView.swift
//  KFormatScreening
//
//  Created by Gavin Kwon on 3/16/23.
//

import SwiftUI
import AVKit

struct PTVideoView: View {
    
    @EnvironmentObject var company: CompanyModel
    @State private var companyShows: [Show] = []
    
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.colorScheme) var colorScheme
    
    @State var selectedCompanyIndex: Int
    @State private var player: AVPlayer?
    @State var isSheetShowing = false
    
    @State var enteredShowType = ""
    @State var enteredShowCompany = ""
    @State var enteredShowPerson = ""
    @State var enteredShowPosition = ""
    @State var enteredShowEmail = ""
    @State var enteredShowPhone = ""
    @State var enteredShowName = ""
    @State var enteredShowImage = ""
    @State var enteredShowLogo = ""
    @State var enteredShowColor = ""
    @State var enteredShowYear = ""
    @State var enteredShowGenre = ""
    @State var enteredShowDescription = ""
    @State var enteredShowTime = ""
    @State var enteredShowEpisodes = ""
    @State var enteredShowUrl = ""
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            HStack(spacing: 15) {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    Image(systemName: "arrowshape.backward.fill")
                        .padding(.leading, -15)
                        .foregroundColor(Color(company.companies[selectedCompanyIndex].companyColor))
                })
                Text(company.companies[selectedCompanyIndex].companyName)
                    .font(Font.custom("Avenir Heavy", size: 24))
                    .frame(maxWidth: .infinity, alignment: .leading)
                Image(company.companies[selectedCompanyIndex].companyLogo)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 40)
                    .clipShape(Circle())
                    .overlay {
                        Circle().stroke(Color(company.companies[selectedCompanyIndex].companyColor), lineWidth: 3)
                    }
                    .opacity(0.6)
                    .padding(.trailing, 3)
            } .padding(.horizontal)
                .onAppear {
                    loadCompanyShows()
                }
            
            NavigationView {
                ScrollView(showsIndicators: false) {
                    
                    ZStack(alignment: .leading) {
                        RectanglePreset()
                            .foregroundColor(Color(company.companies[selectedCompanyIndex].companyColor))
                            .padding(.top, 5)
                            .opacity(0.3)
                            .frame(maxWidth: .infinity)
                            .aspectRatio(16/8,contentMode: .fit)
                        
                        VStack(alignment: .leading, spacing: 10) {
                            Text(company.companies[selectedCompanyIndex].companyPerson)
                                .font(Font.custom("Avenir Heavy", size: 20))
                            Text(company.companies[selectedCompanyIndex].companyPosition)
                                .font(Font.custom("Avenir", size: 18))
                            
                            HStack {
                                Link(company.companies[selectedCompanyIndex].companyPhone + "  | ", destination: URL(string: "tel:\(company.companies[selectedCompanyIndex].companyPhone)")!)
                                    .accentColor(colorScheme == .dark ? .white: .black)
                                    .font(Font.custom("Avenir Roman", size: 15))
                                Link(company.companies[selectedCompanyIndex].companyEmail, destination: URL(string: "mailto:\(company.companies[selectedCompanyIndex].companyEmail)")!)
                                    .accentColor(colorScheme == .dark ? .white: Color("color_event"))
                                    .padding(.top, 1)
                                    .font(Font.custom("Avenir Roman", size: 15))
                            }
                            .padding(.top, 10)
                            Link(company.companies[selectedCompanyIndex].companyUrl, destination: URL(string: "\(company.companies[selectedCompanyIndex].companyUrl)")!)
                                .accentColor(.black)
                                .font(Font.custom("Avenir Roman", size: 15))
                        } .padding()
                    }
                    
                    DashedDivider()
                        .padding(.vertical, 12)
                    
                    VStack(alignment: .leading) {
                        Text(company.companies[selectedCompanyIndex].companyDescription)
                            .font(Font.custom("Avenir", size: 19))
                            .padding(.horizontal)
                    }
                    
                    DashedDivider()
                        .padding(.vertical, 12)
                        .padding(.bottom, 10)
                    
                    ForEach(companyShows.filter { $0.showCompany == company.companies[selectedCompanyIndex].companyName }) { show in
                        
                        Button(action: {
                            enteredShowType = show.showType
                            enteredShowCompany = show.showCompany
                            enteredShowPerson = show.showPerson
                            enteredShowPosition = show.showPosition
                            enteredShowEmail = show.showEmail
                            enteredShowPhone = show.showPhone
                            enteredShowName = show.showName
                            enteredShowImage = show.showImage
                            enteredShowLogo = show.showLogo
                            enteredShowColor = show.showColor
                            enteredShowYear = show.showYear
                            enteredShowGenre = show.showGenre
                            enteredShowDescription = show.showDescription
                            enteredShowTime = show.showTime
                            enteredShowEpisodes = show.showEpisodes
                            enteredShowUrl = show.showUrl
                            
                            isSheetShowing = true
                        }, label: {
                            HStack {
                                Image(show.showImage)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 100)
                                    .cornerRadius(20)
                                    .padding(.trailing, 20)
                                VStack(alignment: .leading) {
                                    Text(show.showName)
                                        .font(Font.custom("Avenir Black", size: 20))
                                        .padding(.bottom, 1)
                                    Divider()
                                    Text(show.showYear + "  |  " + show.showType)
                                        .font(Font.custom("Avenir", size: 16))
                                        .padding(.top, 15)
                                    Text(show.showTime + "  |  " + show.showGenre)
                                        .font(Font.custom("Avenir", size: 16))
                                }
                                .multilineTextAlignment(.leading)
                            }
                            .accentColor(colorScheme == .dark ? .white: .black)
                            .padding(.bottom, 25)
                        })
                        .sheet(isPresented: $isSheetShowing) {
                            PTSheetView(enteredShowType: enteredShowType, enteredShowCompany: enteredShowCompany, enteredShowPerson: enteredShowPerson, enteredShowPosition: enteredShowPosition, enteredShowEmail: enteredShowEmail, enteredShowPhone: enteredShowPhone, enteredShowName: enteredShowName, enteredShowImage: enteredShowImage, enteredShowLogo: enteredShowLogo, enteredShowColor: enteredShowColor, enteredShowYear: enteredShowYear, enteredShowGenre: enteredShowGenre, enteredShowDescription: enteredShowDescription, enteredShowTime: enteredShowTime, enteredShowEpisodes: enteredShowEpisodes, enteredShowUrl: enteredShowUrl)
                        }
                    }
                }
            }
            
            
        }
        .navigationBarBackButtonHidden(true)
        .padding()
    }
    
    func loadCompanyShows() {
        let allShows = company.companies.flatMap { $0.companyShow }
        companyShows = allShows
    }
    
}

struct PTVideoView_Previews: PreviewProvider {
    static var previews: some View {
        PTVideoView(selectedCompanyIndex: 0, enteredShowType: "Non-Scripted", enteredShowCompany: "MBC America", enteredShowPerson: "Hyewon Chung", enteredShowPosition: "Director", enteredShowEmail: "chung@kbsmedia.co.kr", enteredShowPhone: "1-323-935-5001", enteredShowName: "Euphoria 2025", enteredShowImage: "show_mbc1", enteredShowLogo: "logo_kbs", enteredShowColor: "color_kbs", enteredShowYear: "2023", enteredShowGenre: "Comedy, Thriller", enteredShowDescription: "Shaun Murphy, a young autistic surgeon who has savant syndrome, relocates from a quiet country life to join the surgical unit at the prestigious San Jose St. Bonaventure Hospital -- a move strongly supported by his mentor, Dr. Aaron Glassman. Having survived a troubled childhood, Shaun is alone in the world and unable to personally connect with those around him, but he finds his niche using his extraordinary medical skill and intuition to save lives and challenge the skepticism of his colleagues.", enteredShowTime: "70 Minutes", enteredShowEpisodes: "17 Episodes", enteredShowUrl: "https://github.com/kwongavin/kformatscreening/blob/main/muscle1.mp4?raw=true")
            .environmentObject(CompanyModel())
    }
}
