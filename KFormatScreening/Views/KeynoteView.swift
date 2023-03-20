//
//  KeynoteView.swift
//  KFormatScreening
//
//  Created by Gavin Kwon on 3/16/23.
//

import SwiftUI

struct KeynoteView: View {
    
    @EnvironmentObject var keynote: KeynoteModel
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Keynote Interviews")
                    .font(Font.custom("Avenir Heavy", size: 24))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                
                ScrollView {
                    ForEach(keynote.keynotes.shuffled()) { index in
                        
                        NavigationLink(destination: {
                            KeynoteVideoView(enteredKeynotePerson: index.keynotePerson, enteredKeynoteTitle: index.keynoteTitle, enteredKeynoteCompany: index.keynoteCompany, enteredKeynotePosition: index.keynotePosition, enteredKeynoteColor: index.keynoteColor, enteredKeynoteLogo: index.keynoteLogo, enteredkeynoteVideourl: index.keynoteVideourl, keynoteDescription: index.keynoteDescription)
                        }, label: {
                            KeynoteListView(enteredKeynotePerson: index.keynotePerson, enteredKeynoteTitle: index.keynoteTitle, enteredKeynoteImage: index.keynoteImage, enteredKeynoteCompany: index.keynoteCompany, enteredKeynotePosition: index.keynotePosition, enteredKeynoteColor: index.keynoteColor, enteredKeynoteLogo: index.keynoteLogo)
                        })
                        .accentColor(colorScheme == .dark ? .white: .black)
                        Divider()
                            .padding(.vertical)
                        
                    }
                    
                }
            }
        } .padding()
    }
}

struct KeynoteView_Previews: PreviewProvider {
    static var previews: some View {
        KeynoteView()
            .environmentObject(KeynoteModel())
    }
}
