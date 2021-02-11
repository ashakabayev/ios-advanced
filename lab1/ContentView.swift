//
//  ContentView.swift
//  lab1
//
//  Created by Асан Шакабаев on 2/11/21.
//  Copyright © 2021 Асан Шакабаев. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack{
            BackgroundView(topColor: isNight ? .green : .blue, bottomColor:
                isNight ? .gray : Color("lightBlue"))
//            LinearGradient(gradient: Gradient(colors: [.blue, .white]),
//                           startPoint: .topLeading,
//                           endPoint: .bottomTrailing)
//                 .edgesIgnoringSafeArea(.all)
            VStack {
                Text("Cupertino, CA").font(.system(size: 32, weight: .medium, design: .default ))
                    .foregroundColor(.white).padding()
                VStack(spacing: 10) {
                    Image(systemName: isNight ? "moon.stars.fill" : "cloud.sun.fill")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 180, height: 180, alignment: .center)
                    
                    Text("89")
                        .font(.system(size: 70, weight: .medium))
                        .foregroundColor(.white)
                }
                Spacer()
                HStack(spacing: 2) {
                    DayWeatherView(day: "Mon", imageName: "cloud.sun.fill", temperature: "76")
                    DayWeatherView(day: "Mon", imageName: "sun.max.fill", temperature: "76")
                    DayWeatherView(day: "Mon", imageName: "wind.snow", temperature: "76")
                    DayWeatherView(day: "Mon", imageName: "snow", temperature: "76")
                    DayWeatherView(day: "Mon", imageName: "sunset.fill", temperature: "76")
                    DayWeatherView(day: "Mon", imageName: "cloud.sun.fill", temperature: "76")
                    DayWeatherView(day: "Mon", imageName: "wind.snow", temperature: "76")
                }.padding(.horizontal, 50)
                Spacer()
                Button(action: {
                    print("111")
                    self.isNight.toggle()
                }) {
                    Text("Change day time")
                        .frame(width: 280, height: 50, alignment: .center)
                        .background(Color.white)
                        .font(.system(size: 20, weight: .bold, design: .default))
                        .cornerRadius(10)
                        
                }
                Spacer()
            }
        }
//        VStack(
//            Text("Hello, World!").padding()
//            Text("Hello, World!").padding()
//            Text("Hello, World!").padding()
//        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct DayWeatherView: View{
    var day: String
    var imageName: String
    var temperature: String
     
    var body: some View {
        VStack{
            Text(day)
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(.white)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(.white)
                .frame(width: 40, height: 40, alignment: .center)
            Text(temperature)
                .font(.system(size: 20, weight: .medium))
                .foregroundColor(.white)
        }
    }
}
struct BackgroundView: View{
    var topColor: Color
    var bottomColor: Color
     
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [topColor, bottomColor]),
                  startPoint: .topLeading,
                  endPoint: .bottomTrailing)
        .edgesIgnoringSafeArea(.all)
    }
}

