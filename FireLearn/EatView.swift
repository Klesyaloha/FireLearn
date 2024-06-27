//
//  EatView.swift
//  FireLearn
//
//  Created by Klesya Loha on 06/06/2024.
//

import SwiftUI

struct EatView: View {
var width: CGFloat = 300 //CGFloat type donnée pr float pr valeur liés taille ds contexte graphique
var height: CGFloat = 60
@Binding var progress: CGFloat
var color1 = Color.yellow
var color2 = Color.red
var color3 = Color.white
var color4 = Color.blue
var dragonLevelName = ["Bébé Dragon", "Mini Dragon", "Jeune Dragon", "Maître Dragon"]

@State private var dragonId: String = ""
@State private var level: String = ""
@State private var backgroundImageName: String = ""
@State private var levelName: String = ""
    
//fonction pour mettre à jour les variables selon les pourcentages de progression
func updatedDragonInfo() {
    switch progress{
    case 0...25:
        level = ("NIVEAU O")
        dragonId = ("bebeDragon")
        backgroundImageName = ("bebeDragonBackground")
        levelName = dragonLevelName[0]
    case 26...50:
        level = ("NIVEAU I")
        dragonId = ("miniDragon")
        backgroundImageName = ("miniDragonBackground")
        levelName = dragonLevelName[1]
    case 51...75:
        level = ("NIVEAU II")
        dragonId = ("jeuneDragon")
        backgroundImageName = ("jeuneDragonBackground")
        levelName = dragonLevelName[2]
    default:
        level = ("NIVEAU ∞")
        dragonId = ("maitreDragon")
        backgroundImageName = ("maitreDragonBackground")
        levelName = dragonLevelName[3]
    }
}
@StateObject private var chicken = Food(name: "chicken", quantity: 2, isVisible: false, progress: 0)
@StateObject private var piggy = Food(name: "piggy", quantity: 2, isVisible: false, progress: 0)
@StateObject private var batata = Food(name: "batata", quantity: 2, isVisible: false, progress: 0)
    
    var body: some View {
            let multiplier = width / 100
        NavigationStack{
            ZStack {
                Image("eatFond")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                    .opacity(0.9)
                    .blur(radius: /*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
                
                VStack {
                    HStack{
                        Spacer()
                        
                        Text(level)
                            .bold()
                            .padding(50)
                        
                        Spacer()
                    }
                    
                    ZStack(alignment: .leading) {
                        RoundedRectangle(cornerRadius: 20, style: .continuous)
                            .frame(width: width, height: height)
                            .foregroundColor(Color(red: 0.902, green: 0.902, blue: 0.902))
                            .padding(.leading, 25)
                        
                        RoundedRectangle(cornerRadius: 20, style: .continuous)
                            .frame(width: multiplier * progress, height: height)
                            .background(
                                LinearGradient(colors: [color1, color2], startPoint: .leading, endPoint: .trailing)
                                    .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                            )
                            .foregroundColor(.clear)
                            .padding(.leading, 25)
                        
                        HStack {
                            Spacer()
                            Text("\(Int(progress)) %")
                                .bold()
                                .padding(.trailing, 15)
                        }
                    }
                    .padding(.top, -20)
                    
                    Text(levelName)
                        .bold()
                        .padding()
                    
                    Image(dragonId)
                        .resizable()
                        .scaledToFit()
                    
                    
                    Spacer()
                    
                    ZStack{
                        HStack {
                            Button(action: {
                                if !piggy.isVisible && !batata.isVisible && chicken.quantity > 0 {
                                    chicken.isVisible.toggle()
                                    chicken.position = CGPoint(x: 200, y: 670)
                                }
                                
                            }, label: {
                                Image(chicken.name)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .padding(.all, 10.0)
                                    .background(Color(red: 0.849, green: 0.663, blue: 0.485))
                                    .frame(width: 90.0, height: 90.0)
                                    .cornerRadius(45)
                            })
                            
                            Button(action: {
                                if !chicken.isVisible && !batata.isVisible && piggy.quantity > 0 {
                                    piggy.isVisible.toggle()
                                    piggy.position = CGPoint(x: 200, y: 670)
                                }
                            }, label: {
                                Image(piggy.name)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .padding(.all, 10.0)
                                    .frame(width: 90, height: 90)
                                    .background(Color(red: 0.991, green: 0.829, blue: 0.741))
                                    .cornerRadius(45)
                            })
                            
                            Button(action: {
                                if !chicken.isVisible && !piggy.isVisible && batata.quantity > 0 {
                                    batata.isVisible.toggle()
                                    batata.position = CGPoint(x: 200, y: 670)
                                }
                            }, label: {
                                Image(batata.name)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .padding(.all, 10.0)
                                    .frame(width: 90, height: 90)
                                    .background(Color(red: 0.963, green: 0.777, blue: 0.554))
                                    .cornerRadius(45)
                            })
                        }
                        .padding(.bottom, 70.0)
                        
                        Image(systemName: "\(chicken.quantity).square.fill")
                            .padding(.trailing, 130.0)
                            .padding(.bottom, 115.0)
                            .foregroundColor(Color(red: 0.999, green: 0.359, blue: 0.181))
                        
                        Image(systemName: "\(piggy.quantity).square.fill")
                            .padding(.leading, 66.0)
                            .padding(.bottom, 115.0)
                            .foregroundColor(Color(red: 0.999, green: 0.359, blue: 0.181))
                        
                        Image(systemName: "\(batata.quantity).square.fill")
                            .padding(.leading, 262.0)
                            .padding(.bottom, 115.0)
                            .foregroundColor(Color(red: 0.999, green: 0.359, blue: 0.181))
                        
                    }
                }
                    .edgesIgnoringSafeArea(.bottom)
                    .onAppear {
                        updatedDragonInfo() // SUI pour pouvoir exécuter le code inclus lorsque la view apparait et maj les infos du dragon
                    }
                
                if batata.isVisible {
                    Image(batata.name)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100, height: 100)
                        .position(batata.position)
                        .gesture(
                            DragGesture()
                                .onChanged { value in
                                    batata.position = value.location
                                }
                                .onEnded { _ in
                                    batata.progress = progress
                                    batata.checkCollision()
                                    progress = batata.progress
                                    updatedDragonInfo()
                                }
                        )
                }
                
                if chicken.isVisible {
                    Image(chicken.name)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100, height: 100)
                        .position(chicken.position)
                        .gesture(
                            DragGesture()
                                .onChanged { value in
                                    chicken.position = value.location
                                }
                                .onEnded { _ in
                                    chicken.progress = progress
                                    chicken.checkCollision()
                                    progress = chicken.progress
                                    updatedDragonInfo()
                                }
                        )
                }
                
                if piggy.isVisible {
                    Image("piggy")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100, height: 100)
                        .position(piggy.position)
                        .gesture(
                            DragGesture()
                                .onChanged { value in
                                    piggy.position = value.location
                                }
                                .onEnded { _ in
                                    piggy.progress = progress
                                    piggy.checkCollision()
                                    progress = piggy.progress
                                    updatedDragonInfo()
                                }
                        )
                }
            }
        }
    }
}


struct EatView_Previews: PreviewProvider {
    @State static var progressPreview: CGFloat = 50.0

    static var previews: some View {
        EatView(progress: $progressPreview)
    }
}
