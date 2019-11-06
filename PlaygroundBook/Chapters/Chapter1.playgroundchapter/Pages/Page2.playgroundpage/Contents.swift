//#-hidden-code
//
//  See LICENSE folder for this template’s licensing information.
//
//  Abstract:
//  The Swift file containing the source code edited by the user of this playground book.
//
//#-end-hidden-code
/*:
 # Step 2: Start with the basics
 
 * callout(Task):
 Goal: Learn how to organize and reuse code.
 
 The code base is getting longer, let's reorganize them by spiltting into another view.
 
 * callout(Task):
 You'll extract the card view into its own structure.
 
 With organized code base, we can move the view easily.
 
 When you've successfully got a **basic layou**, you can go to the **[next page](@next)**.
 */

import SwiftUI
import PlaygroundSupport

struct ContentView: View {
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                Button(action: { }) {
                    Image("Spork")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 120)
                }
                .foregroundColor(.black)
                .shadow(radius: 8)
                .offset(y: 10)
                
                ZStack {
                    // 2.1) Extract into `CardBackView`
                    
                    VStack {
                        Image(systemName: "hourglass")
                            .font(Font.largeTitle.weight(.black))
                        
                        Text("Tasting more food...")
                            .font(.title)
                            .fontWeight(.bold)
                    }
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 600)
                    
                    // 2.2) Extract into `CardView`
                }
            }
            
            Spacer()
        }
    }
}

PlaygroundPage.current.setLiveView(ContentView())
