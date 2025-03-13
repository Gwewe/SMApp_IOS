//
//  HomeView.swift
//  SMApp
//
//  Created by Wedna Guirand on 18/01/2025.
//

import SwiftUI

struct HomeView: View {
    @State private var isAnimationPlaying = true
    
    var body: some View {
        ZStack{
            Color("Background_Green")
                .edgesIgnoringSafeArea(.all)
            
            
            VStack (spacing: 20)  {
                Text("SustainMate")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                    .padding()
                
                HStack (spacing: 5){
                    Text("Together, we harness our collective wisdom to forge a brighter, greener future.")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 10)
                    
                    Image(systemName: "sparkles")
                        .font(.title)
                        .foregroundColor(Color("HandColor"))
                    
                }
                
                
                LottieView(animationName: "earthHome")
                    .frame(width: homeWidth, height: homeHeight)
                
                Text("A hub for individuals and communities to connect, collaborate, and share insights on sustainability.")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 15)
                
            }
            .navigationTitle("Home")
            .navigationBarHidden(true)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            
        }
    }
}
        

private extension HomeView {
    var homeWidth: CGFloat {
        UIScreen.main.bounds.width - 60
    }
    
    var homeHeight: CGFloat {
        UIScreen.main.bounds.height / 2.7
    }
}

#Preview {
    HomeView()
}
