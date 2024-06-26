//
//  PlayView.swift
//  FireLearn
//
//  Created by Klesya Loha on 06/06/2024.
//

import SwiftUI

struct PlayView: View {
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

@StateObject private var peluche = Article(name: "peluche", isVisible: false)
@StateObject private var cubes = Article(name: "cubes", isVisible: false)
@StateObject private var tower = Article(name: "tower", isVisible: false)
    
    var body: some View {
            let multiplier = width / 100
        NavigationStack{
            ZStack {
                Image("playfond")
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
                    
                    HStack {
                        Button(action: {
                            if !cubes.isVisible && !tower.isVisible {
                                peluche.isVisible.toggle()
                                peluche.position = CGPoint(x: 200, y: 670)
                            }
                            
                        }, label: {
                            Image(peluche.name)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .padding(.all, 13.0)
                                .frame(width: 90.0, height: 90.0)
                                .background(Color(hue: 0.08, saturation: 0.293, brightness: 0.894))
                                .cornerRadius(45)
                        })
                        
                        Button(action: {
                            if !peluche.isVisible && !tower.isVisible {
                                cubes.isVisible.toggle()
                                cubes.position = CGPoint(x: 200, y: 670)
                            }
                        }, label: {
                            Image(cubes.name)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .padding(.all, 13.0)
                                .frame(width: 90, height: 90)
                                .background(Color(hue: 0.446, saturation: 0.073, brightness: 0.839))
                                .cornerRadius(45)
                        })
                        
                        Button(action: {
                            if !peluche.isVisible && !cubes.isVisible {
                                tower.isVisible.toggle()
                                tower.position = CGPoint(x: 200, y: 670)
                            }
                        }, label: {
                            Image(tower.name)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .padding(.all, 15.0)
                                .frame(width: 90, height: 90)
                                .background(Color(hue: 0.745, saturation: 0.087, brightness: 0.929))
                                .cornerRadius(45)
                        })
                    }
                    .padding(.bottom, 70.0)
                }
                    .edgesIgnoringSafeArea(.bottom)
                    .onAppear {
                        updatedDragonInfo() // SUI pour pouvoir exécuter le code inclus lorsque la view apparait et maj les infos du dragon
                    }
                
                if cubes.isVisible {
                    Image(cubes.name)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100, height: 100)
                        .position(cubes.position)
                        .gesture(
                            DragGesture()
                                .onChanged { value in
                                    cubes.position = value.location
                                }
                        )
                }
                
                if peluche.isVisible {
                    Image(peluche.name)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 150.0, height: 150.0)
                        .position(peluche.position)
                        .gesture(
                            DragGesture()
                                .onChanged { value in
                                    peluche.position = value.location
                                }
                        )
                }
                
                if tower.isVisible {
                    Image(tower.name)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100, height: 100)
                        .position(tower.position)
                        .gesture(
                            DragGesture()
                                .onChanged { value in
                                    tower.position = value.location
                                }
                        )
                }
            }
        }
    }
}

struct PlayView_Previews: PreviewProvider {
    @State static var progressPreview: CGFloat = 50.0

    static var previews: some View {
        PlayView(progress: $progressPreview)
    }
}
