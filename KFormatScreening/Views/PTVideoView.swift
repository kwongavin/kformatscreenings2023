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
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.colorScheme) var colorScheme
    
    @State var selectedCompanyIndex: Int
    @State private var player: AVPlayer?
//    @State private var isFullScreen = false
    
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
            
//            let url = URL(string: company.companies[selectedCompanyIndex].companyPTurl)
//            if url != nil {
//                VideoPlayer(player: player) // AVPlayer(url: url!))
//                    .aspectRatio(16/9, contentMode: .fit)
//                    .cornerRadius(10)
//                    .onAppear(perform: {
//                        self.player = AVPlayer(url: url!)
//                        self.player?.play()
//                    })
//                    .onDisappear {
//                        self.player?.pause()
//                        self.player = nil
////                        AVPlayer().replaceCurrentItem(with: nil)
//                    }
//            }
            
            ScrollView(showsIndicators: false) {
                
//                DashedDivider()
//                    .padding(.vertical, 10)
                
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
                                .accentColor(colorScheme == .dark ? .white: .black)
                                .padding(.top, 1)
                                .font(Font.custom("Avenir", size: 15))
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
            }
            
            
        }
        .navigationBarBackButtonHidden(true)
        .padding()
    }
}

struct PTVideoView_Previews: PreviewProvider {
    static var previews: some View {
        PTVideoView(selectedCompanyIndex: 0)
            .environmentObject(CompanyModel())
    }
}
