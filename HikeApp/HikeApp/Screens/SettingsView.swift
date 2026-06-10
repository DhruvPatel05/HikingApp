//
//  SettingsView.swift
//  HikeApp
//
//  Created by Dhruv Patel on 08/06/26.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        // MARK: - SECTION: HEADER
        VStack {
            HStack {
                Spacer()
                Image(systemName: "laurel.leading")
                    .font(.system(size: 80,weight: .black))
                
                VStack(spacing: -10) {
                    Text("Hike")
                        .font(.system(size: 66,weight: .black))
                    Text("Editors' Choice ")
                }
                Image(systemName: "laurel.trailing")
                    .font(.system(size: 80,weight: .black))
                Spacer()
            }
            .foregroundStyle(LinearGradient(colors:[.customGreenLight,.customGreenMedium,.customGreenDark
                                                   ],
                                            startPoint: .top,
                                            endPoint: .bottom
                                           )
            )
            .padding(.top,8)
            
            Text("Where can you find \nperfect tracks")
                .font(.title2)
                .fontWeight(.heavy)
            
            // MARK: - SECTION Icons
            
            // MARK: - SECTION About
            
            // MARK: List
            
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}

