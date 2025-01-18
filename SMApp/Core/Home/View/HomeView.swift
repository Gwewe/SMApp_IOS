//
//  HomeView.swift
//  SMApp
//
//  Created by Wedna Guirand on 18/01/2025.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        Text("Join us in uniting minds and sharing knowledge to create a brighter, greener future together")
        ZStack {
            Image(.home)
                .frame(width: homeWidth ,height: homeHeight)
                .clipShape(RoundedRectangle(cornerRadius: 10))
        }
        
        Text("A central platform for connecting with individuals and communities to share information about sustainability.")
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
