//
//  StartView.swift
//  FireLearn
//
//  Created by Klesya Loha on 09/06/2024.
//

import SwiftUI

struct StartView: View {
    
    @StateObject var manager = NotificationManager()
    var body: some View {
        
        NavigationStack {
            ZStack {
                LinearGradient(
                stops: [
                Gradient.Stop(color: Color(red: 0.49, green: 0.7, blue: 0.62), location: 0.00),
                Gradient.Stop(color: Color(red: 1, green: 0.69, blue: 0.03), location: 1.00),
                ],
                startPoint: UnitPoint(x: 0.5, y: 0.68),
                endPoint: UnitPoint(x: 0.5, y: 1)
                )
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                
                Image("startFond")
                    .resizable()
                    .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    .blendMode(.luminosity)
                
                VStack {
                    ZStack {
                        Text("Bienvenu.e\ndans")
                            .font(.custom("Wonderful Fonty Cure!", size: 61, relativeTo: .title))
                            .foregroundColor(.black)
                            .multilineTextAlignment(.center)
                            .position(x: 200, y: 119)
                        
                        Text("Bienvenu.e\ndans")
                            .font(.custom("Wonderful Fonty Cure!", size: 60, relativeTo: .title))
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                            .shadow(radius: /*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/,y: 7)
                            .position(x: 200, y: 121)
                    }
                    ZStack {
                        Text("FireLearn")
                            .font(.custom("Wonderful Fonty Cure!", size: 73))
                            .foregroundColor(/*@START_MENU_TOKEN@*/Color(red: 1.0, green: 0.8705882352941177, blue: 0.6274509803921569)/*@END_MENU_TOKEN@*/)
                            .position(x: 200, y: -68)
                        
                        Text("FireLearn")
                            .font(.custom("Wonderful Fonty Cure!", size: 72, relativeTo: .title))
                            .foregroundColor(.clear)
                            .multilineTextAlignment(.center)
                            .overlay(
                                LinearGradient(
                                    gradient: Gradient(colors: [/*@START_MENU_TOKEN@*/Color(red: 1.0, green: 0.08235294117647059, blue: 0.08627450980392157)/*@END_MENU_TOKEN@*/, /*@START_MENU_TOKEN@*/Color(red: 0.996078431372549, green: 0.6901960784313725, blue: 0.027450980392156862)/*@END_MENU_TOKEN@*/]),
                                    startPoint: .leading,
                                    endPoint: .trailing
                                )
                                .mask(
                                    Text("FireLearn")
                                        .font(.custom("Wonderful Fonty Cure!", size: 72, relativeTo: .title))
                                        .foregroundColor(/*@START_MENU_TOKEN@*/Color(red: 0.996078431372549, green: 0.6901960784313725, blue: 0.027450980392156862)/*@END_MENU_TOKEN@*/)
                                )
                            )
                            .position(x: 200, y: -66)
                    }
                    
                    NavigationLink(destination: {
                        TamagoDragonView(progress: 50)
                            .navigationBarBackButtonHidden()
                    }, label: {
                        Text("Entrer")
                            .font(.custom("Wonderful Fonty Cure!", size: 20))
                            .padding()
                            .padding(.horizontal, 80.0)
                            .foregroundColor(.white)
                            .background(Color(red: 1.0, green: 0.4627450980392157, blue: 0.17647058823529413))
                            .cornerRadius(/*@START_MENU_TOKEN@*/9.0/*@END_MENU_TOKEN@*/)
                    })
                    .padding(.bottom, 59.0)
                }
            }
        }
    }
}

#Preview {
    StartView()
}
