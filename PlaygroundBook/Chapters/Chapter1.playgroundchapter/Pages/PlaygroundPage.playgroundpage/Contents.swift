//#-hidden-code
//
//  See LICENSE folder for this template’s licensing information.
//
//  Abstract:
//  The Swift file containing the source code edited by the user of this playground book.
//
//#-end-hidden-code
/*:
 # Hello! We hope you’ve been enjoying the session so far. Now it’s time to start coding!
 
 We're going to learn about building an iconic user interaction that is composed of dragging gesture and animations. We will learn about [SwiftUI](https://developer.apple.com/xcode/swiftui/) and [Swift Playgrounds](https://www.apple.com/swift/playgrounds/). You can learn more about these by tapping the links.
 
 
 Let's start by trying our final demo.
 
 * callout(Project Demo):
 Tap `Run My Code` on the right. Then, swipe the image to the left or right and see what happens.
 
 In the next steps we’ll start writing a few lines of code. We will break into steps. If you cannot follow, you can still go to the next page with a starting template.
 Are you ready to start? Let's go to the **[next page](@next)**. 
 */
//#-code-completion(everything, hide)

import SwiftUI
import PlaygroundSupport

// =========================
// MARK: - Main Content View
// =========================

struct ContentView: View {
    @ObservedObject var store: FoodStore
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                Button(action: { }) {
                    Image("Spork")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: /*#-editable-code points*/120/*#-end-editable-code*/)
                }
                .foregroundColor(/*#-editable-code color*/.black/*#-end-editable-code*/)
                .shadow(radius: /*#-editable-code points*/8/*#-end-editable-code*/)
                .offset(y: /*#-editable-code points*/10/*#-end-editable-code*/)
                
                ZStack {
                    VStack {
                        Image(systemName: "hourglass")
                            .font(Font.largeTitle.weight(.black))

                        Text(/*#-editable-code Text*/"Tasting more food..."/*#-end-editable-code*/)
                            .font(.title)
                            .fontWeight(.bold)
                    }
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 600)

                    ForEach(store.foods) { food in
                        CardView(image: food.image, food: food.name, restaurant: food.restaurant)
                    }
                }
            }
            
            Spacer()
        }
        .onAppear(perform: store.fetch)
    }
}

// ==========================
// MARK: - Swipable Card View
// ==========================

struct CardView: View {
    var image: String = "papaya_salad"
    var food: String = "Papaya Salad"
    var restaurant: String = "Pun Pun Market"
    
    @State var offset = CGSize.zero
    
    var body: some View {
        ZStack(alignment: .leading) {
            Group {
                Image(image)
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 600)
            .cornerRadius(/*#-editable-code points*/10/*#-end-editable-code*/)
            
            VStack(alignment: .leading) {
                Spacer()
                
                Text(food)
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                
                Text(restaurant)
                    .font(.body)
                    .foregroundColor(.white)
            }
            .frame(height: 600)
            .padding()
            .padding(.bottom, 20)
            
            VStack {
                HStack {
                    Text(/*#-editable-code Text*/"LIKE"/*#-end-editable-code*/)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(/*#-editable-code color*/.green/*#-end-editable-code*/)
                        .padding(4)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.green, lineWidth: 2)
                                .frame(width: 100)
                    )
                        .rotationEffect(Angle(degrees: /*#-editable-code points*/-15/*#-end-editable-code*/))
                        .opacity(Double(self.offset.width / 50))
                    
                    Spacer()
                    
                    Text(/*#-editable-code Text*/"NOPE"/*#-end-editable-code*/)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(/*#-editable-code color*/.red/*#-end-editable-code*/)
                        .padding(4)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.red, lineWidth: 2)
                                .frame(width: 120)
                    )
                        .rotationEffect(Angle(degrees: /*#-editable-code points*/15/*#-end-editable-code*/))
                        .opacity(Double(self.offset.width / -50))
                }
                .padding(.horizontal, 28)
                
                Spacer()
            }
            .padding(.top, 28)
            .frame(height: 600)
        }
        .cornerRadius(/*#-editable-code points*/8/*#-end-editable-code*/)
        .shadow(radius: /*#-editable-code points*/8/*#-end-editable-code*/)
        .padding()
        .rotationEffect(Angle(degrees: Double(offset.width / 10)))
        .offset(x: offset.width, y: offset.height)
        .gesture(
            DragGesture()
                .onChanged { self.offset = $0.translation }
                .onEnded {
                    if $0.translation.width < -100 {
                        self.offset = .init(width: -1000, height: 0)
                    } else if $0.translation.width > 100 {
                        self.offset = .init(width: 1000, height: 0)
                    } else {
                        self.offset = .zero
                    }
            }
        )
            .animation(.spring())
    }
}

// ==================
// MARK: - Data Store
// ==================

struct Food: Identifiable {
    let id = UUID()
    var image: String
    var name: String
    var restaurant: String
}

final class FoodStore: ObservableObject {
    @Published var foods: [Food] = []
    
    func fetch() {
        foods = [
            Food(image: "fruit_bowl", name: "Fruit Bowl", restaurant: "Pun Pun Market"),
            Food(image: "papaya_salad", name: "Som Tum", restaurant: "Pun Pun Market"),
            Food(image: "pencake", name: "Pencake", restaurant: "Pun Pun Market"),
            Food(image: "mango_sticky_rice", name: "Mango Sticky Rice", restaurant: "Central Plaza Airport"),
            Food(image: "pineapple_rice", name: "Pineapple Fried Rice", restaurant: "Cooking Love"),
            Food(image: "thai_sausage", name: "Northern Thai Sausage", restaurant: "Saturday Night Market"),
            ].shuffled()
    }
}

PlaygroundPage.current.setLiveView(ContentView(store: FoodStore()))
