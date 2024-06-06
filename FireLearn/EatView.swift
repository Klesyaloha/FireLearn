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
@State var percent: CGFloat = 50
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
    switch percent{
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
@State private var numberOfChicken = 2
@State private var numberOfPiggy = 2
@State private var numberOfBatata = 2
@State private var isChickenVisible = false
@State private var isPiggyVisible = false
@State private var isBatataVisible = false
@State private var foodPosition = CGPoint(x: 200, y: 670)
// Position de la bouche du dragon
    let mouthPosition = CGPoint(x: 215, y: 390)
    
    var body: some View {
            let multiplier = width / 100
        NavigationView{
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
                            .frame(width: multiplier * percent, height: height)
                            .background(
                                LinearGradient(colors: [color1, color2], startPoint: .leading, endPoint: .trailing)
                                    .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                            )
                            .foregroundColor(.clear)
                            .padding(.leading, 25)
                        
                        HStack {
                            Spacer()
                            Text("\(Int(percent)) %")
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
                    
                    HStack {
                        Button(action: {
                            isChickenVisible.toggle()
                            foodPosition = CGPoint(x: 200, y: 670)
                        }, label: {
                            Image("chicken")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .padding(.all, 10.0)
                                .background(Color(red: 0.849, green: 0.663, blue: 0.485))
                                .frame(width: 90.0, height: 90.0)
                                .cornerRadius(45)
                        })
                        
                        Button(action: {
                            isPiggyVisible.toggle()
                            foodPosition = CGPoint(x: 200, y: 670)
                        }, label: {
                            Image("piggy")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .padding(.all, 10.0)
                                .frame(width: 90, height: 90)
                                .background(Color(red: 0.991, green: 0.829, blue: 0.741))
                                .cornerRadius(45)
                        })
                        
                        Button(action: {
                            isBatataVisible.toggle()
                            foodPosition = CGPoint(x: 200, y: 670)
                        }, label: {
                            Image("batata")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .padding(.all, 10.0)
                                .frame(width: 90, height: 90)
                                .background(Color(red: 0.963, green: 0.777, blue: 0.554))
                                .cornerRadius(45)
                        })
                    }
                    .padding(.bottom, 70.0)
                }
                    .edgesIgnoringSafeArea(.bottom)
                    .onAppear {
                        updatedDragonInfo() // SUI pour pouvoir exécuter le code inclus lorsque la view apparait et maj les infos du dragon
                    }
                
                if isBatataVisible && !isChickenVisible && !isPiggyVisible {
                    Image("batata")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100, height: 100)
                        .position(foodPosition)
                        .gesture(
                            DragGesture()
                                .onChanged { value in
                                    foodPosition = value.location
                                }
                                .onEnded { _ in
                                    checkCollision()
                                }
                        )
                }
                
                if isChickenVisible && !isBatataVisible && !isPiggyVisible {
                    Image("chicken")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100, height: 100)
                        .position(foodPosition)
                        .gesture(
                            DragGesture()
                                .onChanged { value in
                                    foodPosition = value.location
                                }
                                .onEnded { _ in
                                    checkCollision()
                                }
                        )
                }
                
                if isPiggyVisible && !isChickenVisible && !isBatataVisible{
                    Image("piggy")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100, height: 100)
                        .position(foodPosition)
                        .gesture(
                            DragGesture()
                                .onChanged { value in
                                    foodPosition = value.location
                                }
                                .onEnded { _ in
                                    checkCollision()
                                }
                        )
                }
            }
        }
    }
    func checkCollision() {
        let dx = mouthPosition.x - foodPosition.x
        let dy = mouthPosition.y - foodPosition.y
        
        if abs(dx) <= 70 && abs(dy) <= 70 {
            if percent < 100 {
                percent += 4
            }
            
            if isChickenVisible && !isBatataVisible && !isPiggyVisible {
                isChickenVisible = false
            } else if isPiggyVisible && !isChickenVisible && !isBatataVisible {
                isPiggyVisible = false
            } else if isBatataVisible && !isChickenVisible && !isPiggyVisible {
                isBatataVisible = false
            }
        }
    }
}


#Preview {
    EatView()
}
