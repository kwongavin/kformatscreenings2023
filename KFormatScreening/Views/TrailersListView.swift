//
//  TrailersListView.swift
//  KFormatScreening
//
//  Created by Gavin Kwon on 3/17/23.
//

import SwiftUI

struct TrailersListView: View {
    
    @State var enteredShowType: String
    @State var enteredShowName: String
    @State var enteredShowImage: String
    @State var enteredShowLogo: String
    @State var enteredShowColor: String
    @State var enteredShowYear: String
    @State var enteredShowGenre: String
    @State var enteredShowTime: String
    @State var enteredShowEpisodes: String
    @State var enteredShowUrl: String
    
    var body: some View {
        
        LazyVStack(alignment: .leading) {
            
            HStack {
                Image(enteredShowImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100)
                    .cornerRadius(20)
                    .padding(.trailing, 20)
                VStack(alignment: .leading) {
                    HStack {
                        Text(enteredShowName)
                            .font(Font.custom("Avenir Black", size: 20))
                            .padding(.bottom, 1)
                        Spacer()
                        Image(enteredShowLogo)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 30)
                            .clipShape(Circle())
                            .overlay {
                                Circle().stroke(Color(enteredShowColor), lineWidth: 2)
                            }
                            .opacity(0.6)
                            .padding([.bottom, .trailing], 3)
                    }
                    Divider()
                    Text(enteredShowYear + "  |  " + enteredShowType)
                        .font(Font.custom("Avenir", size: 16))
                        .padding(.top, 15)
                    Text(enteredShowTime + "  |  " + enteredShowGenre)
                        .font(Font.custom("Avenir", size: 16))
                }
            }
            
        }
        
    }
}

struct TrailersListView_Previews: PreviewProvider {
    static var previews: some View {
        TrailersListView(enteredShowType: "Scripted", enteredShowName: "Fellow Citizens!", enteredShowImage: "show_kbs1", enteredShowLogo: "logo_kbs", enteredShowColor: "color_kbs", enteredShowYear: "2023", enteredShowGenre: "Comedy, Thriller", enteredShowTime: "30 Minutes", enteredShowEpisodes: "17 Episodes", enteredShowUrl: "https://github.com/kwongavin/kformatscreening/blob/main/muscle1.mp4?raw=true")
    }
}
