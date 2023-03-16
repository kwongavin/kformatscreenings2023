//
//  PTDetailView.swift
//  KFormatScreening
//
//  Created by Gavin Kwon on 3/16/23.
//

import SwiftUI

struct PTCompanyListView: View {
    
    @EnvironmentObject var company: CompanyModel
    @State var selectedPTIndex: Int
    
    var body: some View {
        ScrollView {
            LazyVStack(alignment: .leading) {
                
                HStack {
                    Image(company.companies[selectedPTIndex].companyLogo)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100)
                        .cornerRadius(20)
                        .padding(.trailing, 20)
                    VStack(alignment: .leading) {
                        Text(company.companies[selectedPTIndex].companyName)
                            .font(Font.custom("Avenir Black", size: 25))
                            .padding(.bottom, 1)
                    }
                }
                
            }
        }

    }
}

struct PTDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PTCompanyListView(selectedPTIndex: 1)
            .environmentObject(CompanyModel())
    }
}
