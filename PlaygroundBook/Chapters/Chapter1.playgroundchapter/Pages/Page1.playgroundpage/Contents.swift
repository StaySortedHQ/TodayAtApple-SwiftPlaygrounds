//#-hidden-code
//
//  See LICENSE folder for this template’s licensing information.
//
//  Abstract:
//  The Swift file containing the source code edited by the user of this playground book.
//
//#-end-hidden-code
/*:
 # Step 1: Start with the basics
 
 * callout(Task):
 Goal: Learn how to write code.
 
 To start, we're going to learn a little bit of syntax of Swift.
 
 * callout(Tip):
 If you get stuck, don't worry. The Apple team and Sorted team are here to help.
 
 First, you'll apply some changes to the existing text.
 
 * callout(Task):
 You'll create a title and a rectangle.
 
 Then, we can add a rectangle above the text.
 
 When you've successfully got a **basic layout**, you can go to the **[next page](@next)**.
 */

import SwiftUI
import PlaygroundSupport

struct ContentView: View {
    var body: some View {
        // 1.1) Start here to customize Text
        Text("Hello World!")
        
        // 1.2) Now uncomment the following code for a vertical layout
        /*
        VStack {
            Rectangle()
                .fill(Color.blue)
                .cornerRadius(8)
                .frame(width: 300, height: 300)
            Text("Now you've added some elements")
        }
        */
    }
}

PlaygroundPage.current.setLiveView(ContentView())
