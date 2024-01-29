//
//  HomeView.swift
//  WeatherApp
//
//  Created by Leonardo on 29/01/24.
//

import SwiftUI

struct WeatherData {
    let day: String
    let icon: String
    let graus: String
}

struct HomeView: View {
    
    @State private var isNight: Bool = false
    
    let weatherList = [
           WeatherData(day: "SEG", icon: "cloud.sun.fill", graus: "22"),
           WeatherData(day: "TER", icon: "cloud.fill", graus: "28"),
           WeatherData(day: "QUA", icon: "sun.max.fill", graus: "33"),
           WeatherData(day: "QUI", icon: "cloud.fill", graus: "18"),
           WeatherData(day: "SEX", icon: "wind.snow", graus: "16"),
           
       ]
    
    var body: some View {
        ZStack {
            
            LinearGradient(gradient: Gradient(colors: isNight ? [Color.blue, Color("blue_white")] : 
                                                [Color.gray, Color.black]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
            
            
            VStack {
                
                HStack {
                    
                    Spacer()
                    Spacer()
                    
                    Text("Urucânia, MG")
                        .font(.system(size: 32, weight: .medium, design: .default))
                        .foregroundStyle(Color.white)
                        .padding()
                    
                    Spacer()
                    
                    
                    Image(systemName: isNight ? "sun.max.fill" : "moonphase.waxing.crescent.inverse")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 28, height: 28)
                        .padding(.trailing)
                        .onTapGesture {
                            isNight.toggle()
                        }
                }
                
                VStack(spacing: 10) {
                    Image(systemName: isNight ? "sun.max.fill" : "moon.fill")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 160, height: 180)
                    
                    Text("30°C")
                        .font(.system(size: 48, weight: .medium))
                        .foregroundStyle(Color.white)

                        
                }
                
                Spacer()
                
                HStack() {
                    
                    LazyHGrid(rows: [GridItem(.fixed(20))], spacing: 28) {
                        ForEach(weatherList, id: \.day) { weatherData in
                            DayView(
                                day: weatherData.day,
                                icon: weatherData.icon,
                                graus: weatherData.graus
                            )
                        }
                    }
                    
                }
                
                Spacer()
                
                Button {
                    print ("tapped")
                } label: {
                    Text ("Change Day Time")
                        .frame(width: 280, height: 50)
                        .background(Color.white)
                        .font(.system(size: 20, weight: .bold, design: .default))
                        .clipShape(.rect(cornerRadius: 8))
                    
                }
                Spacer()
            
                Spacer()
                
                
            }
            
            
        }
    }
}

#Preview {
    HomeView()
}

struct DayView : View {
    
    var day: String
    var icon: String
    var graus: String
    
    var body: some View {
        VStack(spacing:6) {
            Text(day)
                .font(.system(size: 20, weight: .medium))
                .foregroundStyle(Color.white)
                .bold(true)
            
            Image(systemName: icon)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 44, height: 44)
            
            Text("\(graus)°C")
                .font(.system(size: 20, weight: .medium))
                .foregroundStyle(Color.white)
            
        }
    }
}
