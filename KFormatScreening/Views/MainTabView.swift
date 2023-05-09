//
//  mainTabView.swift
//  KFormatScreening
//
//  Created by Gavin Kwon on 3/16/23.
//

import SwiftUI

struct MainTabView: View {
    
    @EnvironmentObject var company: CompanyModel
//    @AppStorage("onboardingShowing") var onboardingShowing = true
    @State var onboardingShowing = true
    
    var body: some View {
        
        TabView {
            
            WelcomeView()
                .tabItem {
                    VStack {
                        Image(systemName: "house.circle")
                        Text("Home")
                    }
                }
            
            PTView()
                .tabItem {
                    VStack {
                        Image(systemName: "building.2.crop.circle.fill")
                        Text("Companies")
                    }
                }
            
            TrailersView()
                .tabItem {
                    VStack {
                        Image(systemName: "film.circle")
                        Text("Trailers")
                    }
                }
            
            WebPageView()
                .tabItem {
                    VStack {
                        Image(systemName: "person.crop.circle.fill")
                        Text("Register")
                    }
                }
        }
        .sheet(isPresented: $onboardingShowing) {
            OnboardingView(onboardingShowing: $onboardingShowing)
//                .presentationDetents([.medium, .large])
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
            .environmentObject(CompanyModel())
    }
}
