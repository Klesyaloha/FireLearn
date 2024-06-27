//
//  SkinView.swift
//  FireLearn
//
//  Created by Klesya Loha on 06/06/2024.
//

import SwiftUI

struct SkinView: View {
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

@StateObject var glasses = Article(name: "glasses", isVisible: false)
@StateObject var chapeau = Article(name: "chapeau", isVisible: false)
@StateObject var noeud = Article(name: "noeud", isVisible: false)
    
    var body: some View {
            let multiplier = width / 100
        NavigationStack{
            ZStack {
                Image("skinFond")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                    .opacity(0.6)
                    .blur(radius: 2.5)
                
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
                    
                    HStack {
                        Button(action: {
                            glasses.isVisible.toggle()
                            
                            if levelName == dragonLevelName[2] {
                                glasses.position = CGPoint(x: 217, y: 376)
                            } else if levelName == dragonLevelName[3] {
                                glasses.position = CGPoint(x: 198, y: 395)
                            } else {
                                glasses.position = CGPoint(x: 196, y: 416)
                            }
                            
                                
                            
                        }, label: {
                            Image(glasses.name)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .padding(.all, 11.0)
                                .frame(width: 90.0, height: 90.0)
                                .background(Color(hue: 0.986, saturation: 0.282, brightness: 0.963))
                                .cornerRadius(45)
                        })
                        
                        Button(action: {
                            chapeau.isVisible.toggle()
                            if levelName == dragonLevelName[2] {
                                chapeau.position = CGPoint(x: 207, y: 270)
                            } else if levelName == dragonLevelName[3] {
                                chapeau.position = CGPoint(x: 199, y: 291)
                            } else {
                                chapeau.position = CGPoint(x: 203, y: 282)
                            }
                            
                        }, label: {
                            Image(chapeau.name)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .padding(.all, 16.0)
                                .frame(width: 90, height: 90)
                                .background(Color(hue: 0.029, saturation: 0.039, brightness: 0.438))
                                .cornerRadius(45)
                        })
                        
                        Button(action: {
                            noeud.isVisible.toggle()
                            if levelName == dragonLevelName[1] {
                                noeud.position = CGPoint(x: 194, y: 505)
                            } else if levelName == dragonLevelName[0] {
                                noeud.position = CGPoint(x: 194, y: 484)
                            } else if levelName == dragonLevelName[3] {
                                noeud.position = CGPoint(x: 197, y: 512)
                            } else {
                                noeud.position = CGPoint(x: 213, y: 472)
                            }
                            
                                
                        }, label: {
                            Image(noeud.name)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .padding(.all, 19.0)
                                .frame(width: 90, height: 90)
                                .background(Color(hue: 0.997, saturation: 0.429, brightness: 0.927))
                                .cornerRadius(45)
                        })
                    }
                    .padding(.bottom, 70.0)
                }
                    .edgesIgnoringSafeArea(.bottom)
                    .onAppear {
                        updatedDragonInfo() // SUI pour pouvoir exécuter le code inclus lorsque la view apparait et maj les infos du dragon
                    }
                
                if chapeau.isVisible {
                    Image("chapeau")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 200.0, height: 200.0)
                        .position(chapeau.position)
                        .gesture(
                            DragGesture()
                                .onChanged { value in
                                    chapeau.position = value.location
                                }
                                .onEnded { _ in
                                    
                                }
                        )
                }
                
                if glasses.isVisible {
                    Image("glasses")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 230.0, height: 230.0)
                        .position(glasses.position)
                        .gesture(
                            DragGesture()
                                .onChanged { value in
                                    glasses.position = value.location
                                }
                                .onEnded { _ in
                                    
                                }
                        )
                }
                
                if noeud.isVisible {
                    Image("noeud")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 120.0, height: 120.0)
                        .position(noeud.position)
                        .gesture(
                            DragGesture()
                                .onChanged { value in
                                    noeud.position = value.location
                                }
                                .onEnded { _ in
                                    print(noeud.position)
                                }
                        )
                }
            }
        }
    }
}

struct SkinView_Previews: PreviewProvider {
    @State static var progressPreview: CGFloat = 50.0

    static var previews: some View {
        SkinView(progress: $progressPreview)
    }
}
