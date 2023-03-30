//
//  OnboardingView.swift
//  KFormatScreening
//
//  Created by Gavin Kwon on 3/30/23.
//

import SwiftUI

struct OnboardingView: View {
    
    @State private var inProgress = false
    @State private var tabSelection = 0
    
    var body: some View {
        
            TabView(selection: $tabSelection) {
                
                ZStack {
                    VStack {
                        Spacer()
                        LottieView(name: "onboarding2",
                                   loopMode: .loop)
                        .aspectRatio(contentMode: .fit)
                        .padding(.bottom, 250)
                        Spacer()
                        Spacer()
                    }
                    VStack {
                        Spacer()
                        Spacer()
                        Text("Welcome to\nK-Format Screenings 2023!")
                            .font(Font.custom("Avenir Black", size: 22))
                            .padding(.bottom, 15)
                        Text("From gripping dramas to thrilling reality programs, experience the innovative and cutting-edge content crafted by Korea's top media companies.")
                            .font(Font.custom("Avenir", size: 16))
                            .padding(.horizontal, 50)
                        Spacer()
                    }
                }
                .tag(0)
                
                ZStack {
                    VStack {
                        Spacer()
                        LottieView(name: "onboarding3",
                                   loopMode: .loop)
                        .aspectRatio(contentMode: .fit)
                        .padding(.bottom, 300)
                        Spacer()
                        Spacer()
                    }
                    VStack {
                        Spacer()
                        Spacer()
                        Text("Check out the hottest\nKorean TV Shows!")
                            .font(Font.custom("Avenir Black", size: 22))
                            .padding(.bottom, 15)
                            .offset(x: -30)
                        Text("Take a moment to explore each company's introduction and learn more about their unique style and approach. We hope you enjoy this immersive experience and discover your next must-watch show.")
                            .font(Font.custom("Avenir", size: 16))
                            .padding(.horizontal, 50)
                        Spacer()
                    }
                }
                .tag(1)
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
    }
}


//LottieView(name: "onboarding3",
//           loopMode: .loop)
//.aspectRatio(contentMode: .fill)



struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
