//
//  ContentView.swift
//  SwiftUiSlots
//
//  Created by Henry Ifebunandu on 11/3/23.
//

import SwiftUI

struct ContentView: View {
    
    let slots = ["apple", "cherry", "star"]
    
    @State var first = 0
    @State var second = 0
    @State var third = 0
    @State var credits = 25
    
    @State private var showAlert = false
    
    
    var body: some View {
        VStack{
            Text("SwiftUI Slots!")
                .font(.title)
                .fontWeight(.semibold)
            
            Spacer()
            
            Text("Credits: " + String(credits))
                .font(.body)
            
            Spacer()
            
            HStack{
                Spacer()
                
                Image(slots[first]).resizable().scaledToFit().frame( height: 80)
                
                Spacer()
                
                Image(slots[second]).resizable().scaledToFit().frame( height: 80)
                
                Spacer()
                
                Image(slots[third]).resizable().scaledToFit().frame( height: 80)
                
                Spacer()
                
               
            }
            
            Spacer()
            
            Button{
                let firstRandomIndex = Int.random(in: 0...2)
                let secondRandomIndex = Int.random(in: 0...2)
                let thirdRandomIndex = Int.random(in: 0...2)
                
                
                if (credits >= 5) {
                    first = firstRandomIndex
                    second = secondRandomIndex
                    third = thirdRandomIndex

                    if (firstRandomIndex == secondRandomIndex && secondRandomIndex == thirdRandomIndex) {
                        credits += 25
                    } else {
                        credits -= 5
                    }
                } else {
                    showAlert = true
                }
                
            } label: {
                Text("Spin")
                    .foregroundColor(Color.white)
            }.alert(isPresented: $showAlert) {
                Alert(
                    title: Text("You have no more credits!"),
                    message: Text("You have exhausted your credits. Get more or quit?" ),
                    primaryButton: .default(
                        Text("Reload"),
                        action: {
                            showAlert = false
                            credits = 25
                        }
                    ),
                    secondaryButton: .destructive(
                        Text("Quit"),
                        action: {
                            showAlert = false
                        }
                    )
                )
            }
            .frame(width: 120.0, height: 40)
            .background(Color.red)
            .clipShape(Capsule())
            
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
