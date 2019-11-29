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
        //#-editable-code
        Text("Hello World!")
        //#-end-editable-code
        
        // 1.2) Now uncomment the following code for a vertical layout
        //#-editable-code
        /*
        //#-end-editable-code
        VStack {
            Rectangle()
                .fill(/*#-editable-code color*/Color.blue/*#-end-editable-code*/)
                .cornerRadius(/*#-editable-code points*/8/*#-end-editable-code*/)
                .frame(width: /*#-editable-code points*/300/*#-end-editable-code*/, height: /*#-editable-code points*/300/*#-end-editable-code*/)
            Text("Now you've added some elements")
        }
        //#-editable-code
        */
        //#-end-editable-code
    }
}

PlaygroundPage.current.setLiveView(ContentView())
