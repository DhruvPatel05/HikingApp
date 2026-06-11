//
//  SettingsView.swift
//  HikeApp
//
//  Created by Dhruv Patel on 08/06/26.
//

import SwiftUI

struct SettingsView: View {
    // MARK: - PROPERTIES
    
    private let alternateAppIcons: [String] = [
        "AppIcon-MagnifyingGlass",
        "AppIcon-Map",
        "AppIcon-Mushroom",
        "AppIcon-Camera",
        "AppIcon-Backpack",
        "AppIcon-Campfire"
    ]
    @State private var isChangingIcon = false
    
    var body: some View {
        List {
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
                .foregroundStyle(
                    LinearGradient(
                        colors:[
                            .customGreenLight,
                            .customGreenMedium,
                            .customGreenDark
                        ],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
                .padding(.top,8)
                
                VStack(spacing:8) {
                    Text("Where can you find \nperfect tracks")
                        .font(.title2)
                        .fontWeight(.heavy)
                    
                    Text("The Hike Which looks gorgeous in the photo, but even better once you are actually there. The hike that you hope to do again someday. \nFind the best day hikes in the app.")
                        .font(.footnote)
                        .italic()
                    
                    Text("Dust off the boots! It's time for a walk.")
                        .fontWeight(.heavy)
                        .foregroundColor(.customGreenMedium)
                }
                .multilineTextAlignment(.center)
                .padding(.bottom,16)
                .frame(maxWidth:.infinity)
            }
            // MARK: - HEADER
            .listRowSeparator(.hidden)
            // MARK: - SECTION Icons
            Section(header: Text("Alternate Icons")) {
                ScrollView(.horizontal,showsIndicators: false) {
                    HStack(spacing:12) {
                        ForEach(alternateAppIcons.indices, id: \.self) {
                            item in
                            Button {
                                print("Icon was pressed.")
                                
                                guard UIApplication.shared.supportsAlternateIcons else {
                                       print("Alternate app icons are not supported.")
                                       return
                                   }

                                   guard !isChangingIcon else {
                                       print("Icon change already in progress.")
                                       return
                                   }

                                   let iconName = alternateAppIcons[item]

                                   guard UIApplication.shared.alternateIconName != iconName else {
                                       print("This icon is already selected.")
                                       return
                                   }

                                   isChangingIcon = true

                                   UIApplication.shared.setAlternateIconName(iconName) { error in
                                       DispatchQueue.main.async {
                                           isChangingIcon = false

                                           if let error = error {
                                               print("Failed request to update the app's icon: \(error.localizedDescription)")
                                               print(error)
                                           } else {
                                               print("Success! You changed the app icon to \(iconName)")
                                           }
                                       }
                                   }
                               } label: {
                                   Image("\(alternateAppIcons[item])-Preview")
                                       .resizable()
                                       .scaledToFit()
                                       .frame(width: 80, height: 80)
                                       .cornerRadius(16)
                               }
                               .buttonStyle(.borderless)
                               .disabled(isChangingIcon)
                        }
                    }
                }// Scroll view
                .padding(.top,12)
                Text("Choose your favourite app icon from the collection above.")
                    .frame(minWidth:0,maxWidth: .infinity)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.secondary)
                    .font(.footnote)
                    .padding(.bottom,12)
            }
            .listRowSeparator(.hidden)
            // MARK: - SECTION About
            
            Section(
                header:Text("ABOUT THE APP"),
                footer: HStack {
                    Spacer()
                    Text("Copyright © 2021, All rights reserved.")
                    Spacer()
                }
                .padding(.vertical,8)
            ) {
                // 1. Basic Labeled Content
                // LabeledContent("Application", value: "Hike")
                // 2. Advance Labeled Content
                CustomListRowView(
                    rowLabel: "Application",
                    rowIcon: "apps.iphone",
                    rowContent: "HIKE",
                    rowTintColor: .blue
                )
                
                CustomListRowView(
                    rowLabel: "Compatibility",
                    rowIcon: "info.circle",
                    rowContent: "iOS, iPadOS",
                    rowTintColor: .red
                )
                
                CustomListRowView(
                    rowLabel: "Technology",
                    rowIcon: "swift",
                    rowContent: "Swift",
                    rowTintColor: .orange
                )
                
                CustomListRowView(
                    rowLabel: "Version",
                    rowIcon: "gear",
                    rowContent: "1.0",
                    rowTintColor: .purple
                )
                
                CustomListRowView(
                    rowLabel: "Developer",
                    rowIcon: "ellipsis.curlybraces",
                    rowContent: "John Doe",
                    rowTintColor: .mint
                )
                
                CustomListRowView(
                    rowLabel: "Designer",
                    rowIcon: "paintpalette",
                    rowContent: "Robert Petras",
                    rowTintColor: .pink
                )
                
                CustomListRowView(
                    rowLabel: "Website",
                    rowIcon: "globe",
                    rowTintColor:.indigo,
                    rowLinkLabel: "Credo Academy",
                    rowLinkDestination: "https://credo.academy"
                )
                
            }//: SECTION
            // MARK: List
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}

