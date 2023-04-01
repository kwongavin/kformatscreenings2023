//
//  TrailersVideoView.swift
//  KFormatScreening
//
//  Created by Gavin Kwon on 3/17/23.
//

import SwiftUI
import AVKit

struct TrailersVideoView: View {
    
    @State var enteredShowType: String
    @State var enteredShowCompany: String
    @State var enteredShowPerson: String
    @State var enteredShowPosition: String
    @State var enteredShowEmail: String
    @State var enteredShowPhone: String
    @State var enteredShowName: String
    @State var enteredShowImage: String
    @State var enteredShowLogo: String
    @State var enteredShowColor: String
    @State var enteredShowYear: String
    @State var enteredShowGenre: String
    @State var enteredShowDescription: String
    @State var enteredShowTime: String
    @State var enteredShowEpisodes: String
    @State var enteredShowUrl: String
    
    @State private var player: AVPlayer?
    
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            HStack(spacing: 15) {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    Image(systemName: "arrowshape.backward.fill")
                        .padding(.leading, -15)
                        .foregroundColor(Color(enteredShowColor))
                })
                Text(enteredShowName)
                    .font(Font.custom("Avenir Black", size: 24))
                    .frame(maxWidth: .infinity, alignment: .leading)
                Image(enteredShowLogo)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 30)
                    .clipShape(Circle())
                    .overlay {
                        Circle().stroke(Color(enteredShowColor), lineWidth: 3)
                    }
                    .opacity(0.5)
                    .padding([.trailing, .bottom], 3)
            } .padding(.horizontal)
            
            let url = URL(string: enteredShowUrl)
            if url != nil {
                VideoPlayer(player: player)
                    .aspectRatio(16/9, contentMode: .fit)
                    .cornerRadius(10)
                    .onAppear(perform: {
                        self.player = AVPlayer(url: url!)
                        self.player?.play()
                    })
                    .onDisappear {
                        self.player?.pause()
                        self.player = nil
                    }
            }
            
            ScrollView(showsIndicators: false) {
                
                DashedDivider()
                    .padding(.vertical, 10)
                
                ZStack(alignment: .leading) {
                    RectanglePreset()
                        .foregroundColor(Color(enteredShowColor))
                        .padding(.top, 5)
                        .opacity(0.2)
                        .frame(maxWidth: .infinity)
                        .aspectRatio(16/4,contentMode: .fit)
                    
                    VStack(alignment: .leading, spacing: 5) {
                        HStack {
                            Text(enteredShowYear + "  | ")
                                .font(Font.custom("Avenir Roman", size: 18))
                            Text(enteredShowGenre)
                                .font(Font.custom("Avenir Roman", size: 18))
                        }
                        
                        HStack {
                            Text(enteredShowEpisodes + "  | ")
                                .font(Font.custom("Avenir Roman", size: 18))
                            Text(enteredShowTime)
                                .font(Font.custom("Avenir Roman", size: 18))
                        }
                    } .padding()
                }
                
                DashedDivider()
                    .padding(.vertical, 12)
                
                VStack(alignment: .leading) {
                    Text(enteredShowDescription)
                        .font(Font.custom("Avenir", size: 19))
                        .padding(.horizontal)
                }
                
                Divider()
                    .padding(.vertical, 10)
                
                ZStack(alignment: .leading) {
                    RectanglePreset()
                        .foregroundColor(Color(enteredShowColor))
                        .padding(.top, 5)
                        .opacity(0.2)
                        .frame(maxWidth: .infinity)
                        .aspectRatio(16/6.5,contentMode: .fit)
                    
                    VStack(alignment: .leading, spacing: 10) {
                        
                        Text(enteredShowCompany)
                            .font(Font.custom("Avenir Black", size: 22))
                        DashedDivider()
                        HStack {
                            Text(enteredShowPerson)
                                .font(Font.custom("Avenir Heavy", size: 20))
                            Text("|  " + enteredShowPosition)
                                .font(Font.custom("Avenir", size: 18))
                        }
                        
                        HStack {
                            Link(enteredShowPhone + "  | ", destination: URL(string: "tel:\(enteredShowPhone)")!)
                                .accentColor(colorScheme == .dark ? .white: .black)
                                .font(Font.custom("Avenir Roman", size: 15))
//                            Text(enteredShowPhone + "  | " )
//                                .font(Font.custom("Avenir Roman", size: 15))
                            Link(enteredShowEmail, destination: URL(string: "mailto:\(enteredShowEmail)")!)
                                .accentColor(colorScheme == .dark ? .white: .black)
                                .padding(.top, 1)
                                .font(Font.custom("Avenir", size: 15))
//                            Text(enteredShowEmail)
//                                .padding(.top, 1)
//                                .font(Font.custom("Avenir", size: 15))
//                                .textSelection(.enabled)
                        }
                    } .padding()
                }
            }
            
        }
        .navigationBarBackButtonHidden(true)
        .padding()
    }
}

struct TrailersVideoView_Previews: PreviewProvider {
    static var previews: some View {
        TrailersVideoView(enteredShowType: "Non-Scripted", enteredShowCompany: "MBC America", enteredShowPerson: "Hyewon Chung", enteredShowPosition: "Director", enteredShowEmail: "chung@kbsmedia.co.kr", enteredShowPhone: "1-323-935-5001", enteredShowName: "Euphoria 2025", enteredShowImage: "show_mbc1", enteredShowLogo: "logo_kbs", enteredShowColor: "color_kbs", enteredShowYear: "2023", enteredShowGenre: "Comedy, Thriller", enteredShowDescription: "Shaun Murphy, a young autistic surgeon who has savant syndrome, relocates from a quiet country life to join the surgical unit at the prestigious San Jose St. Bonaventure Hospital -- a move strongly supported by his mentor, Dr. Aaron Glassman. Having survived a troubled childhood, Shaun is alone in the world and unable to personally connect with those around him, but he finds his niche using his extraordinary medical skill and intuition to save lives and challenge the skepticism of his colleagues.", enteredShowTime: "70 Minutes", enteredShowEpisodes: "17 Episodes", enteredShowUrl: "https://github.com/kwongavin/kformatscreening/blob/main/muscle1.mp4?raw=true")
    }
}
