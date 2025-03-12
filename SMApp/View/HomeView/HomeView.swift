//
//  HomeView.swift
//  SMApp
//
//  Created by Wedna Guirand on 18/01/2025.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack  {
            Text("Join us in uniting minds and sharing knowledge to create a brighter, greener future together")
            ZStack {
                Image(.home)
                    .frame(width: homeWidth ,height: homeHeight)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    //.background(Color(red: 35/255, green:57/255, blue:50/255))
                    .opacity(0.6)
            }
            
            Text("A central platform for connecting with individuals and communities to share information about sustainability.")
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        //.border(Color.red)
        .background(Color("Background_Green"))
        
    }
}

private extension HomeView {
    var homeWidth: CGFloat {
        UIScreen.main.bounds.width - 20
    }
    
    var homeHeight: CGFloat {
        UIScreen.main.bounds.height / 3
    }
}

#Preview {
    HomeView()
}
