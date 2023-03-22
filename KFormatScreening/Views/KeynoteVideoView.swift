//
//  KeynoteVideoView.swift
//  KFormatScreening
//
//  Created by Gavin Kwon on 3/19/23.
//

import SwiftUI
import AVKit

struct KeynoteVideoView: View {
    
    @EnvironmentObject var keynote: KeynoteModel
    
    @State var enteredKeynotePerson: String
    @State var enteredKeynoteTitle: String
    @State var enteredKeynoteCompany: String
    @State var enteredKeynotePosition: String
    @State var enteredKeynoteColor: String
    @State var enteredKeynoteLogo: String
    @State var enteredkeynoteVideourl: String
    @State var keynoteDescription: String
    
    @State private var player: AVPlayer?
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            HStack(spacing: 18) {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    Image(systemName: "arrowshape.backward.fill")
                        .padding(.leading, -15)
                        .foregroundColor(Color(enteredKeynoteColor))
                })
                Text(enteredKeynoteTitle)
                    .font(Font.custom("Avenir Black", size: 24))
                    .frame(maxWidth: .infinity, alignment: .leading)
            } .padding(.horizontal)
            
            let url = URL(string: enteredkeynoteVideourl)
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
                
                Divider()
                    .padding(.vertical, 10)
                
                ZStack(alignment: .leading) {
                    RectanglePreset()
                        .foregroundColor(Color(enteredKeynoteColor))
                        .padding(.top, 5)
                        .opacity(0.2)
                        .frame(maxWidth: .infinity)
                        .aspectRatio(16/4,contentMode: .fit)
                    
                    VStack(alignment: .leading, spacing: 10) {
                            Text(enteredKeynotePerson)
                                .font(Font.custom("Avenir Heavy", size: 20))
                        HStack {
                            Text(enteredKeynotePosition + "  | ")
                                .font(Font.custom("Avenir Roman", size: 17))
                            Text(enteredKeynoteCompany)
                                .font(Font.custom("Avenir Roman", size: 17))
                        }
                    } .padding()
                }
                Divider()
                    .padding(.vertical, 10)
                
                Text(keynoteDescription)
                    .font(Font.custom("Avenir", size: 19))
                    .padding(.horizontal)
            }
        }
        .navigationBarBackButtonHidden(true)
//        .padding()
    }
}

struct KeynoteVideoView_Previews: PreviewProvider {
    static var previews: some View {
        KeynoteVideoView(enteredKeynotePerson: "Craig Plestis", enteredKeynoteTitle: "How to bring the best of the industry", enteredKeynoteCompany: "Smart Dog Media", enteredKeynotePosition: "CEO", enteredKeynoteColor: "color_craig", enteredKeynoteLogo: "logo_craig", enteredkeynoteVideourl: "https://github.com/kwongavin/kformatscreening/blob/main/muscle1.mp4?raw=true", keynoteDescription: "The team at Smart Dog Media love television, plain and simple. We love it so much we’ve devoted our lives to it – watching it, talking it, making it. Television is the canvas where we paint imaginative stories unlike anything ever seen before. Whether it’s a game show that turns everyday objects into the keys that can win a million dollars, or a reality competition featuring giant fighting robots, we’re always striving to push the medium forward into the future… and beyond.\n\nFounded by television veteran Craig Plestis, Smart Dog Media has been one of the entertainment industry’s leading broadcast and cable network production companies.")
    }
}
