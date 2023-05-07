//
//  presentationView.swift
//  KFormatScreening
//
//  Created by Gavin Kwon on 3/16/23.
//

import SwiftUI

struct PTView: View {
    
    @EnvironmentObject var company: CompanyModel
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        
        NavigationView {
            VStack(alignment: .leading) {
                
                Text("Companies")
                    .font(Font.custom("Avenir Heavy", size: 24))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                
                ScrollView(showsIndicators: false) {
                    ForEach(company.companies.indices.shuffled(), id:\.self) { index in
                        NavigationLink(destination: PTVideoView(selectedCompanyIndex: index), label: {
                            PTListView(selectedPTIndex: index)
                                .frame(height:100)
                                .padding(.vertical, 15)
                                .accentColor(colorScheme == .dark ? .white: .black)
                        })
                        Divider()
                    }
                }
            }
            .padding()
            .onAppear {
                company.companies.shuffle()
            }
        }
    }
}

struct PTView_Previews: PreviewProvider {
    static var previews: some View {
        PTView()
            .environmentObject(CompanyModel())
    }
}
