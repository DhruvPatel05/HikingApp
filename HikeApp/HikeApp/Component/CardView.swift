//
//  CardView.swift
//  HikeApp
//
//  Created by Dhruv Patel on 04/06/26.
//

import SwiftUI

struct CardView: View {
    // MARK: - PROPERTIES
    
    @State private var imageNumber: Int = 1
    @State private var randomNumber: Int = 1
    @State private var isShowingSheet: Bool = false
    
    // MARK: - Functions
    
    func randomImage() {
        print("The Button was pressed.")
        print("Status: old image number = \(imageNumber)")
        repeat {
            randomNumber = Int.random(in: 1...5)
            print("Action: Random Number Generated = \(randomNumber)")

        } while randomNumber == imageNumber
        imageNumber = randomNumber
        print("Result: New Image Number = \(imageNumber)")
        print("--- The End ----")
        print("\n")

    }
    
    var body: some View {
        ZStack {
            CustomBackgroundView()
            VStack {
                // MARK:  - HEADER
                VStack(alignment:.leading) {
                    HStack {
                        Text("Hiking")
                            .fontWeight(.black)
                            .font(.system(size: 52))
                            .foregroundStyle(
                                LinearGradient(
                                    colors:[
                                        .customGrayLight,.customGrayMedium],
                                    startPoint: .top,
                                    endPoint: .bottom)
                            )
                        Spacer()
                        Button {
                          //Action Show a Sheet
                            print("The Button was pressed.")
                            isShowingSheet.toggle()
                        } label: {
                            CustomButtonView()
                        }
                        .sheet(isPresented: $isShowingSheet) {
                            SettingsView()
                        }
                    }
                    Text("Fun and enjoyable outdoor activity for friends and families.")
                        .multilineTextAlignment(.leading)
                        .italic()
                        .foregroundColor(.customGrayMedium)
                } //: HEADER
                .padding(.horizontal,30)
                // MARK: - MAIN CONTENT
                
                
                ZStack {
                    CustomeCircleView()
                    Image("image-\(imageNumber)")
                        .resizable()
                        .scaledToFit()
                        .animation(.default,value:imageNumber)
                }
                //MARK: - FOOTER
                Button {
                  //Action: Generate a Random Number
                    randomImage()
                } label: {
                    Text("Explore More")
                        .font(.title2)
                        .fontWeight(.heavy)
                        .foregroundStyle(
                            LinearGradient( colors:[
                                .customGreenLight,.customGreenMedium
                            ],
                                    startPoint: .top,
                                    endPoint: .bottom)
                        )
                        .shadow(color: .black.opacity(0.25), radius:0.25,x:1,y:2)
                }
                .buttonStyle(GradientButton())
            } // : ZStack
        }// : CARD
        .frame(width:320,height:570)
    }
}

#Preview {
    CardView()
}
