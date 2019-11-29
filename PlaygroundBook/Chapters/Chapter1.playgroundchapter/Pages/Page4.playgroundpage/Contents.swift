//#-hidden-code
//
//  See LICENSE folder for this template’s licensing information.
//
//  Abstract:
//  The Swift file containing the source code edited by the user of this playground book.
//
//#-end-hidden-code
/*:
 # Step 4: Include data model
 
 * callout(Task):
 Goal: Create more cards with a list of food names and images
 
 Now, having just one or two food choices are not fun. Let's add more food.
 
 * callout(Task):
 You'll create an array of food choices and show them with a for-loop.
 
 Instead of copying the `CardView` for many times, we can display a list of food choices using a for-loop.
 
 ## Congratulations
 
 You've finished this tutorial. Now you're capable to start your app development journey.
 */

import SwiftUI
import PlaygroundSupport

struct ContentView: View {
    @ObservedObject var store: FoodStore
    
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
                    
                    // 4.1) Show multiple images using for-loop
                    //#-editable-code
                    CardView()
                    //#-end-editable-code
                }
            }
            
            Spacer()
        }
        .onAppear(perform: store.fetch)
    }
}

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
            .cornerRadius(10)
            
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
                    Text("LIKE")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.green)
                        .padding(4)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.green, lineWidth: 2)
                                .frame(width: 100)
                    )
                        .rotationEffect(Angle(degrees: -15))
                        .opacity(Double(self.offset.width / 50))
                    
                    Spacer()
                    
                    Text("NOPE")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.red)
                        .padding(4)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.red, lineWidth: 2)
                                .frame(width: 120)
                    )
                        .rotationEffect(Angle(degrees: 15))
                        .opacity(Double(self.offset.width / -50))
                }
                .padding(.horizontal, 28)
                
                Spacer()
            }
            .padding(.top, 28)
            .frame(height: 600)
        }
        .cornerRadius(8)
        .shadow(radius: 8)
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
            Food(image: "fruit_bowl",
                 name: "Fruit Bowl",
                 restaurant: "Pun Pun Market"),
            Food(image: "papaya_salad",
                 name: "Som Tum",
                 restaurant: "Pun Pun Market"),
            Food(image: "pencake",
                 name: "Pencake",
                 restaurant: "Pun Pun Market"),
            Food(image: "mango_sticky_rice",
                 name: "Mango Sticky Rice",
                 restaurant: "Central Plaza Airport"),
            Food(image: "pineapple_rice",
                 name: "Pineapple Fried Rice",
                 restaurant: "Cooking Love"),
            Food(image: "thai_sausage",
                 name: "Northern Thai Sausage",
                 restaurant: "Saturday Night Market"),
            ].shuffled()
    }
}

PlaygroundPage.current.setLiveView(ContentView(store: FoodStore()))
