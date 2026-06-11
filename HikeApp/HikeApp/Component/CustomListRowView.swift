//
//  CustomListRowView.swift
//  HikeApp
//
//  Created by Dhruv Patel on 10/06/26.
//

import SwiftUI

struct CustomListRowView: View {
    // MARK: - PROPERTIES
    @State var rowLabel: String
    @State var rowIcon: String
    @State var rowContent: String
    @State var rowTintColor: Color


    var body: some View {
           
           // 2. Advance Labeled Content
           LabeledContent {
               Text(rowContent)
                   .foregroundColor(.primary)
                   .fontWeight(.heavy)
           } label: {
               HStack {
                   ZStack {
                       RoundedRectangle(cornerRadius: 8)
                           .frame(width:30,height: 30)
                           .foregroundColor(rowTintColor)
                       Image(systemName: rowIcon)
                           .foregroundColor(.white)
                           .fontWeight(.semibold)
                   }
                   
                   Text("Application")
               }
           }
    }
}


struct CustomListRowView_Previews: PreviewProvider {
    static var previews: some View {
        List {
            CustomListRowView(
                rowLabel: "Designer",
                rowIcon: "paintpalette",
                rowContent: "John Doe",
                rowTintColor: .pink)
        }
    }
}

