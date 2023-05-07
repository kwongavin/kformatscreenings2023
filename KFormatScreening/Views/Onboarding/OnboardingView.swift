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
    
    @Binding var onboardingShowing: Bool
    
    var body: some View {
        
        ZStack {
            
            Image("image_event1")
                .resizable()
                .ignoresSafeArea()
                .aspectRatio(contentMode: .fill)
                .opacity(0.1)
            
            VStack {
                
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
                        VStack(alignment: .leading) {
                            Spacer()
                            Spacer()
                            Text("Welcome to\n2023 K-Broadcasting at\nLA Screenings!")
                                .font(Font.custom("Avenir Black", size: 22))
                                .padding(.bottom, 20)
                            Text("From gripping dramas to thrilling reality programs, experience the innovative and cutting-edge content crafted by Korea's top media companies.")
                                .font(Font.custom("Avenir", size: 17))
                            Spacer()
                        }
                        .padding(35)
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
                        VStack(alignment: .leading) {
                            Spacer()
                            Spacer()
                            Text("Step into the captivating\nworld of K-Broadcasting!")
                                .font(Font.custom("Avenir Black", size: 22))
                                .padding(.bottom, 20)
                            Text("Take a moment to explore each company's introduction and learn more about their unique style and approach. We hope you enjoy this immersive experience and discover your next must-watch show.")
                                .font(Font.custom("Avenir", size: 17))
                            Spacer()
                        }
                        .padding(35)
                    }
                    .tag(1)
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                
                Button(action: {
                    if tabSelection == 0 {
                        tabSelection = 1
                    } else {
                        onboardingShowing = false
                    }
                }, label: {
                    ZStack {
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(height: 48)
                            .cornerRadius(10)
                        
                        Text(tabSelection == 0 ? "Next" : "Get in!")
                            .font(Font.custom("Avenir Heavy", size: 18))
                            .accentColor(Color("color_event"))
                            .padding()
                    }
                })
                .offset(y: -80)
            }
        }
    }
}


//LottieView(name: "onboarding3",
//           loopMode: .loop)
//.aspectRatio(contentMode: .fill)



struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView(onboardingShowing: .constant(false))
    }
}
