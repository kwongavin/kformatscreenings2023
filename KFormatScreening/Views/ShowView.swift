//
//  ShowView.swift
//  KFormatScreening
//
//  Created by Gavin Kwon on 3/16/23.
//

import SwiftUI
import AVKit

struct ShowView: View {
    
    @EnvironmentObject var company: CompanyModel
    @State var selectedCompanyIndex: Int
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            Text(company.companies[selectedCompanyIndex].companyName)
                .font(Font.custom("Avenir Heavy", size: 24))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            
            ScrollView {
                
                let url = URL(string: company.companies[selectedCompanyIndex].companyPTurl)
                if url != nil {
                    VideoPlayer(player: AVPlayer(url: url!))
                        .aspectRatio(16/9, contentMode: .fit)
                        .cornerRadius(10)
                        .onDisappear {
                            AVPlayer().replaceCurrentItem(with: nil)
                        }
                }
                
            }
            
            
        }
        .padding()
    }
}

struct ShowView_Previews: PreviewProvider {
    static var previews: some View {
        ShowView(selectedCompanyIndex: 0)
            .environmentObject(CompanyModel())
    }
}
