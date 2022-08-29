//
//  ContentView.swift
//  AppleWatchStore
//
//  Created by Tello on 21/05/2020.
//  Copyright © 2020 Tello. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var detail = false
    @State var detailData : Watch = data[0]
    var body: some View {
        
        
        ZStack {
            
            Detail(detailData: self.$detailData, detail: self.$detail)
                //expanding view whenever detail view is tapped
                .frame(width: self.detail ? nil : 100, height: self.detail ? nil : 100)
                .opacity(self.detail ? 1 : 0 )
            
            // hiding main view when deatil view is visible
            Home(detailData: self.$detailData, detail: self.$detail)
                .opacity(self.detail ? 0 : 1)
            
        }
        .animation(.default)
            
            // for changing status bar to white or dark
            .preferredColorScheme(self.detail ? .dark : .light)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct Home : View {
    
    @State var index = "ALL"
    @State var tab = 0
    @Binding var detailData : Watch
    @Binding var detail: Bool
    var bottom = UIApplication.shared.windows.first?.safeAreaInsets.bottom
    
    var body : some View {
        
        
        ZStack {
            
            
            Color.black.opacity(0.09).edgesIgnoringSafeArea(.all)
            
            VStack{
                
                
                HStack {
                    
                    Button(action: {
                        
                    }) {
                        
                        
                        Image(systemName: "line.horizontal.3.decrease.circle")
                            .font(.title)
                            .foregroundColor(.black)
                            .padding(.horizontal)
                        
                        
                        
                    }
                    
                    Spacer()
                    
                    
                    Button(action: {
                        
                    }) {
                        
                        
                        Image(systemName: "cart")
                            .font(.title)
                            .foregroundColor(.black)
                            .padding(.horizontal)
                        
                    }
                    
                    
                }
                .padding(.vertical)
                
                HStack {
                    
                    VStack(alignment: .leading, spacing: 10){
                        
                        Text("Welcome Temi !")
                        
                        Text("Discovery")
                            .font(.title)
                            .fontWeight(.bold)
                    }
                    .foregroundColor(.black)
                    
                    
                    Spacer()
                    
                    Button(action: {
                        
                    }) {
                        
                        Image(systemName: "magnifyingglass")
                            .font(.title)
                            .foregroundColor(.black)
                        
                        
                    }
                }
                .padding()
                
                
                ScrollView(.horizontal, showsIndicators: false) {
                    
                    
                    HStack(spacing: 25){
                        
                        //creating a swipe menu ny iteration
                        
                        ForEach(menu, id: \.self) { i in
                            
                            Button(action: {
                                
                                self.index = i
                                
                            }) {
                                
                                Text(i)
                                    .foregroundColor(self.index == i ? Color("Color1"): Color.black.opacity(0.5))
                                    .fontWeight(.bold)
                            }
                        }
                        
                        
                    }
                    .padding(.horizontal)
                }
                
                ScrollView(.horizontal, showsIndicators: false) {
                    
                    HStack(spacing: 25) {
                        
                        ForEach(data, id: \.self) { i in
                            
                            
                            ZStack(alignment: .bottom) {
                                
                                
                                Color("Color").frame(height: UIScreen.main.bounds.height / 3)
                                    .cornerRadius(20)
                                
                                VStack(spacing: 20) {
                                    
                                    Image(i.image)
                                        .resizable()
                                        .frame(width: UIScreen.main.bounds.width / 1.7)
                                        .onTapGesture {
                                            
                                            // assigning data whenever image is tapped
                                            self.detailData = i
                                            self.detail.toggle()
                                    }
                                    
                                    HStack {
                                        
                                        VStack(alignment: .leading, spacing: 12) {
                                            
                                            Text(i.title)
                                                .font(.system(size: 22))
                                            
                                            Text("Apple Watch")
                                                .fontWeight(.bold)
                                                .font(.title)
                                            
                                        }
                                        .foregroundColor(.white)
                                        
                                        Spacer(minLength: 0)
                                        
                                        Button(action: {
                                            
                                            
                                        }) {
                                            
                                            Image(systemName: "plus")
                                                .font(.title)
                                                .foregroundColor(.white)
                                                .padding()
                                                .background(Color("Color1"))
                                                .clipShape(Circle())
                                            
                                        }
                                        
                                    }
                                    
                                    
                                }
                                    
                                .padding(.horizontal)
                                .padding(.bottom)
                                
                            }
                            
                            
                        }
                        
                    }
                    .padding(.horizontal, 20)
                    .padding(.vertical, 25)
                    
                }
                
                HStack {
                    
                    
                    Button(action: {
                        
                        self.tab = 0
                        
                    }) {
                        
                        Image(systemName: "house")
                            .font(.title)
                            .foregroundColor(self.tab == 0 ? .black : Color.black.opacity(0.65))
                        //.padding()
                        
                        Spacer(minLength: 0)
                        
                        
                        Button(action: {
                            self.tab = 1
                            
                        }) {
                            
                            Image(systemName: "arkit")
                                .font(.title)
                                .foregroundColor(self.tab == 1 ? .black : Color.black.opacity(0.25))
                            //.padding()
                        }
                        
                        Spacer(minLength: 0)
                        
                        
                        Button(action: {
                            self.tab = 2
                            
                        }) {
                            
                            Image(systemName: "person")
                                .font(.title)
                                .foregroundColor(self.tab == 2 ? .black : Color.black.opacity(0.25))
                            //.padding()
                        }
                        
                        
                        
                    }
                    
                }
                .padding(.horizontal, 30)
                .padding(.top, 25)
                    // for no safe area Phones padding will be at 15 at bottom
                    .padding(.bottom, self.bottom! == 0 ? 15 : self.bottom! + 10 )
                    .background(Color.white.opacity(9.77))
                    .clipShape(CShape())
                
                
            }
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}


struct CShape : Shape {
    
    func path(in rect: CGRect) -> Path {
        
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.topLeft, .topRight], cornerRadii: CGSize(width: 45, height: 45))
        
        return Path(path.cgPath)
        
    }
}

struct Detail: View {
    
    @State var text = ""
    @State var index = 0
    // sample for designing
    @Binding  var detailData : Watch
    @Binding var detail : Bool
    var bottom = UIApplication.shared.windows.first?.safeAreaInsets.bottom
    
    var body : some View {
        
        
        ZStack {
            
            Color("Color1").edgesIgnoringSafeArea(.all)
            
            
            VStack {
                
                
                HStack {
                    
                    HStack {
                        
                        Button(action: {
                            
                        }) {
                            
                            
                            Image(systemName: "line.horizontal.3.decrease.circle")
                                .font(.title)
                                .foregroundColor(.white)
                                .padding(.horizontal)
                            
                            
                        }
                        
                        Spacer()
                        
                        
                        Button(action: {
                            
                        }) {
                            
                            
                            Image(systemName: "cart")
                                .font(.title)
                                .foregroundColor(.white)
                                .padding(.horizontal)
                            
                        }
                        
                        
                    }
                    .padding(.vertical)
                    
                    
                }
                .padding(.vertical)
                
                HStack(spacing: 15) {
                    
                    Image(systemName: "magnifyingglass")
                        
                        .foregroundColor(.gray)
                    
                    
                    TextField("Want to Search Anything", text: self.$text)
                    
                }
                .padding()
                .background(Color.white)
                .cornerRadius(8)
                
                
                HStack {
                    
                    
                    VStack(alignment: .leading, spacing: 10) {
                        
                        Text(self.detailData.title)
                        
                        Text("Apple Watch Series 5")
                            .font(.title)
                            .fontWeight(.bold)
                        
                        
                        
                    }
                    .foregroundColor(.white)
                    
                    Spacer()
                    
                }
                .padding(.vertical)
                .padding(.horizontal)
                
                HStack {
                    
                    
                    
                    VStack(alignment: .leading, spacing: 12){
                        
                        Text("Color")
                            .foregroundColor(Color.white.opacity(0.6))
                        
                        Text(self.detailData.color)
                            .fontWeight(.bold)
                            .font(.title)
                            .foregroundColor(.white)
                        
                        Text("Price")
                            .foregroundColor(Color.white.opacity(0.6))
                            .padding(.top)
                        
                        Text(self.detailData.price)
                            .fontWeight(.bold)
                            .font(.title)
                            .foregroundColor(.white)
                        
                        
                    }
                    .offset(y: -50)
                    
                    Spacer(minLength: 0)
                    
                    Image(self.detailData.image)
                        .resizable()
                        .frame(width: UIScreen.main.bounds.width / 2 , height: UIScreen.main.bounds.height / 2.5)
                        .rotationEffect(.init(degrees: 0))
                        //.animation(.spring(response: 0.09, dampingFraction: 0.04, blendDuration: 0.05))
                        .animation(.spring()).hueRotation(Angle(degrees: 60.0))
                }
                .padding(.horizontal)
                .padding(.bottom, -50)
                .zIndex(5)
                
                
                
                
                // Zindex sets view position on the stack
                // moving bottom View Up
                
                ZStack(alignment: .topLeading){
                    
                    VStack{
                        
                        // for phones having lesser screen size...
                        
                        ScrollView(.init(), showsIndicators: false) {
                            
                            VStack{
                                
                                HStack(spacing: 0){
                                    
                                    Button(action: {
                                        
                                        self.index = 0
                                        
                                    }) {
                                        
                                        Text("Details")
                                            .foregroundColor(self.index == 0 ? .white : Color.black.opacity(0.6))
                                            .padding(.vertical, 10)
                                            .padding(.horizontal, 25)
                                            .background(self.index == 0 ? Color("Color1") : Color.clear)
                                            .cornerRadius(8)
                                    }
                                    
                                    Button(action: {
                                        
                                        self.index = 1
                                        
                                    }) {
                                        
                                        Text("Description")
                                            .foregroundColor(self.index == 1 ? .white : Color.black.opacity(0.6))
                                            .padding(.vertical, 10)
                                            .padding(.horizontal, 25)
                                            .background(self.index == 1 ? Color("Color1") : Color.clear)
                                            .cornerRadius(8)
                                    }
                                    
                                    Spacer()
                                }
                                
                                
                                if self.index == 0{
                                    
                                    HStack(spacing: 20){
                                        
                                        VStack(spacing: 12){
                                            
                                            Text("15mm")
                                                .font(.title)
                                                .fontWeight(.bold)
                                                .foregroundColor(Color.black.opacity(0.8))
                                            
                                            Text("Strip Width")
                                                .foregroundColor(Color.black.opacity(0.4))
                                        }
                                        
                                        VStack(spacing: 12){
                                            
                                            Text("Leather")
                                                .font(.title)
                                                .fontWeight(.bold)
                                                .foregroundColor(Color.black.opacity(0.8))
                                            
                                            Text("Strip material")
                                                .foregroundColor(Color.black.opacity(0.4))
                                        }
                                        
                                        VStack(spacing: 12){
                                            
                                            Text("50mm")
                                                .font(.title)
                                                .fontWeight(.bold)
                                                .foregroundColor(Color.black.opacity(0.8))
                                            
                                            Text("Water resist")
                                                .foregroundColor(Color.black.opacity(0.4))
                                        }
                                    }
                                    .padding(.top)
                                }
                                else{
                                    
                                    Text("The Apple Watch Series 5 features a new always-on display, built-in compass for advanced navigation features, and a titanium case option.")
                                        .foregroundColor(.black)
                                        .padding(.top)
                                }
                                
                                
                            }
                            .padding(.horizontal, 25)
                        }
                            // due to bottom padding -50
                            .padding(.top, 50)
                        
                        HStack{
                            
                            Button(action: {
                                
                            }) {
                                
                                Text("Add to Cart")
                                    .foregroundColor(.white)
                                    .padding(.vertical)
                                    .frame(width: UIScreen.main.bounds.width / 1.5)
                                    .background(Color("Color1"))
                                    .cornerRadius(10)
                                  
                                
                            }
                            .shadow(radius: 5)
                            
                            Spacer(minLength: 0)
                            
                            Button(action: {
                                
                                // closing the detail view when close button is pressed...
                                self.detail.toggle()
                                
                            }) {
                                
                                Image(systemName: "xmark")
                                    .font(.title)
                                    .foregroundColor(Color.black.opacity(0.8))
                                    .padding(.horizontal)
                            }
                        }
                        .padding(.top,10)
                        .padding(.horizontal, 25)
                        .padding(.bottom,self.bottom! == 0 ? 15 : self.bottom)
                    }
                    .background(Color.white)
                    .clipShape(CShape())
                    
                    Button(action: {
                        
                    }) {
                        
                        Image(systemName: "plus")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color("Color1"))
                            .clipShape(Circle())
                    }
                    .padding(.leading, 50)
                    .offset(y: -35)
                }
                
            }
            
        }
        .edgesIgnoringSafeArea(.bottom)
        
    }
}

struct CustomShape: Shape {
    
    
    func path(in rect: CGRect) -> Path {
        
        return Path{  path in
            
            path.move(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: rect.width, y: 0))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: 0, y: rect.height - 40 ))
            
            
        }
    }
}

// menu Buttons

var menu  = ["ALL", "CLASSIC", "GRAND", "FORMAL", "ORIGINAL", "TREND"]
// sample watch data


struct Watch: Identifiable, Hashable {
    
    var id: Int
    var color: String
    var price: String
    var image: String
    var title: String
}
var data = [  Watch(id: 0, color: "White", price: "$650", image: "white", title: "Classic White"),
              Watch(id: 1, color: "Black", price: "500", image: "black", title: "Classic Black"),
              Watch(id: 2, color: "Gold", price: "$750", image: "gold", title: "Classic Gold"),
              Watch(id: 3, color: "Red", price: "$500", image: "red", title: "Classic Red"),
              Watch(id: 4, color: "Yellow", price: "500", image: "yellow", title: "Classic Yellow")]

