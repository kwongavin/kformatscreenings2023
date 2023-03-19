//
//  KeynoteListView.swift
//  KFormatScreening
//
//  Created by Gavin Kwon on 3/18/23.
//

import SwiftUI

struct KeynoteListView: View {
    
    @EnvironmentObject var keynote: KeynoteModel
    
    @State var enteredKeynotePerson: String
    @State var enteredKeynoteTitle: String
    @State var enteredKeynoteImage: String
    @State var enteredKeynoteCompany: String
    @State var enteredKeynotePosition: String
    @State var enteredKeynoteColor: String
    @State var enteredKeynoteLogo: String
    
    var body: some View {
        
        LazyVStack(alignment: .leading) {
            
            Image(enteredKeynoteImage)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(maxWidth: .infinity, maxHeight: 220)
                .cornerRadius(20)
                .padding(.bottom, 5)
            Text(enteredKeynoteTitle)
                .font(Font.custom("Avenir Black", size: 20))
                .padding(.bottom, 2)
            HStack {
                Text(enteredKeynotePerson)
                    .font(Font.custom("Avenir Roman", size: 19))
                Spacer()
                Text(enteredKeynotePosition + "  |  " + enteredKeynoteCompany)
                    .font(Font.custom("Avenir", size: 16))
            }
            
        }
    }
}

struct KeynoteListView_Previews: PreviewProvider {
    static var previews: some View {
        KeynoteListView(enteredKeynotePerson: "Craig Plestis", enteredKeynoteTitle: "How to produce like a pro", enteredKeynoteImage: "craig", enteredKeynoteCompany: "Smart Dog Media", enteredKeynotePosition: "CEO", enteredKeynoteColor: "color_craig", enteredKeynoteLogo: "logo_craig")
    }
}
