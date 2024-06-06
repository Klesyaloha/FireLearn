//
//  TamagoDragonView.swift
//  FireLearn
//
//  Created by Nouha Achouri on 04/06/2024.
//

import SwiftUI

struct TamagoDragonView: View {
    var width: CGFloat = 300 //CGFloat type donnée pr float pr valeur liés taille ds contexte graphique
    var height: CGFloat = 60
    var percent: CGFloat = 95
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
    
    var body: some View {
            let multiplier = width / 100
        NavigationView{
            ZStack {
                Image(backgroundImageName)
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    HStack{
                        NavigationLink(destination: Text("Paramètres")) {
                            Image("settings")
                                .resizable()
                                .frame(width: 35, height: 35)
                                .cornerRadius(25)
                                .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                                .padding(.leading, 10)
                        }
                        Spacer()
                        
                        Text(level)
                            .bold()
                            .padding(50)
                        
                        Spacer()
                        
                        NavigationLink(destination: Text("Cours")) {
                            Image("grimoire")
                                .resizable()
                                .frame(width: 35, height: 35)
                                .cornerRadius(25)
                                .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                                .padding(.trailing, 10)
                        }
                    }
                    
                    ZStack(alignment: .leading) {
                        RoundedRectangle(cornerRadius: 20, style: .continuous)
                            .frame(width: width, height: height)
                            .foregroundColor(Color.black.opacity(0.1))
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
                        .blendMode(.multiply) // effet multiply pour les images avec un fond blanc
                    
                    Spacer()
                    
                    HStack {
                        NavigationLink(destination: Text("Jouer")) {
                            Image("icon_play")
                                .resizable()
                                .frame(width: 75, height: 75)
                                .cornerRadius(25)
                                .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                                .padding()
                        }
                        NavigationLink(destination: Text("Manger")){
                            Image("icon_eat")
                                .resizable()
                                .frame(width: 75, height: 75)
                                .cornerRadius(25)
                                .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                                .padding()
                        }
                        NavigationLink(destination: Text("Skins")){
                            Image("icon_skins")
                                .resizable()
                                .frame(width: 75, height: 75)
                                .cornerRadius(25)
                                .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                                .padding()
                        }
                    }
                    .padding(.bottom, 30)
                    .frame(maxWidth: .infinity) //SUI couvre tout l'ecran mm en bas
                }
                .edgesIgnoringSafeArea(.bottom)
                .onAppear {
                    updatedDragonInfo() // SUI pour pouvoir exécuter le code inclus lorsque la view apparait et maj les infos du dragon
                }
            }
        }
        }
    }

    #Preview {
        TamagoDragonView()
    }
