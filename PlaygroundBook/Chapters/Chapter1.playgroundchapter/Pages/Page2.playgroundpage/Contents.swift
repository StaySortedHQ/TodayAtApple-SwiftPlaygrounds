//#-hidden-code
//
//  See LICENSE folder for this template’s licensing information.
//
//  Abstract:
//  The Swift file containing the source code edited by the user of this playground book.
//
//#-end-hidden-code
/*:
 # Step 2: Improve the code structure
 
 * callout(Task):
 Goal: Learn how to organize and reuse code.
 
 The code base is getting longer, let's reorganize them by spiltting into another view.
 
 * callout(Task):
 You'll extract the card view into its own structure.
 
 With organized code base, we can move the view easily.
 
 When you've successfully got a **card layout**, you can go to the **[next page](@next)**.
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
                    VStack {
                        Image(systemName: "hourglass")
                            .font(Font.largeTitle.weight(.black))
                        
                        Text("Tasting more food...")
                            .font(.title)
                            .fontWeight(.bold)
                    }
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 600)
                    
                    // 2.1) Extract into `CardView`
                    //#-editable-code
                    VStack {
                        Rectangle()
                            .fill(Color.blue)
                            .cornerRadius(8)
                            .frame(width: 300, height: 300)
                        Text("Hello World!")
                    }
                    //#-end-editable-code
                }
            }
            
            Spacer()
        }
    }
}

struct CardView: View {
    var body: some View {
        // 2.2) First remove the rectangle
        //#-editable-code
        Rectangle()
        //#-end-editable-code
        // 2.3) Paste the code below and customize the view.
        //#-editable-code
        //#-end-editable-code
    }
}

PlaygroundPage.current.setLiveView(ContentView())
