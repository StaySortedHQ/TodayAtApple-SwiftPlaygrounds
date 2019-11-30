//#-hidden-code
//
//  See LICENSE folder for this template’s licensing information.
//
//  Abstract:
//  The Swift file containing the source code edited by the user of this playground book.
//
//#-end-hidden-code
/*:
 # Bonus Step: Customize the images
 
 * callout(Task):
 Goal: Create your own cards with a list of names and images
 
 Now, take some pictures in the store to personalize your app.
 
 * callout(Task):
 You'll take pictures in the store and include in this app.
 
 ## Congratulations
 
 You've made some real changes. Welcome to our developer community!
 */

import SwiftUI
import PlaygroundSupport

struct ContentView: View {
    @ObservedObject var store: ProductStore
    
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
                        
                        Text("Checking out more products...")
                            .font(.title)
                            .fontWeight(.bold)
                    }
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 600)
                    
                    ForEach(store.products) { product in
                        CardView(
                                 // photo: product.photo,
                                 name: product.name,
                                 location: product.location)
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
    // 5.1) Replace image name with `UIImage` object
//    var photo: UIImage
    var name: String = "Video Wall"
    var location: String = "Causeway Bay"
    
    @State var offset = CGSize.zero
    
    var body: some View {
        ZStack(alignment: .leading) {
            Group {
                // 5.2) Show `UIImage` object
                Rectangle()
                    .fill(Color.white)
                /*
                Image(uiImage: photo)
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                */
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 600)
            .cornerRadius(10)
            
            VStack(alignment: .leading) {
                Spacer()
                
                Text(name)
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(.black)
                
                Text(location)
                    .font(.body)
                    .foregroundColor(.black)
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

struct Product: Identifiable {
    let id = UUID()
    // 5.3) Provide `UIImage` as part of the data model
//    var photo: UIImage
    var name: String
    var location: String
}

final class ProductStore: ObservableObject {
    @Published var products: [Product] = []
    
    func fetch() {
        products = [
            // 5.4) Provide `UIImage` for each object
            Product(
                 // photo: ,
                 name: "Video Wall",
                 location: "Causeway Bay"),
            Product(
                 // photo: ,
                 name: "Logo",
                 location: "IFC"),
            Product(
                 // photo: ,
                 name: "Entrance",
                 location: "Festival Walk"),
            Product(
                 // photo: ,
                 name: "Table",
                 location: "APM"),
            Product(
                 // photo: ,
                 name: "Railway",
                 location: "Shatin"),
            ]
        // Uncomment the next line for more fun
//            .shuffled()
    }
}

PlaygroundPage.current.setLiveView(ContentView(store: ProductStore()))
