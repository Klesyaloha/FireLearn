//
//  LevelView.swift
//  FireLearn
//
//  Created by Apprenant 160 on 04/06/2024.
//

import SwiftUI

struct LevelView: View {
    
    @State private var isFoodVisible = false
    @State private var chickenPosition = CGPoint(x: 50, y: 50)
    @State var level : Double = 50
    
    // Position de la bouche du dragon
        let mouthPosition = CGPoint(x: 213, y: 269.0)
        
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(colors: [Color("firered"),Color("fireorange")], startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all)
                
                Text(distanceDescription())
                    .padding()
                    .position(CGPoint(x: 200, y: 10.0))
                
                VStack {
                    HStack {
                        ProgressView(value: level, total: 100)
                            .scaleEffect(y : 10)
                            .accentColor(.black)
                                    
                        Text("\(Int(level))%")
                            .frame(width: 50, height: 0)
                            .bold()
                    }
                    .frame(width: 300, height: 100)
                    .padding(.bottom, -22.0)
                    
                    Spacer()
                    
                    Image("jeuneDragon")
                    
                    Spacer()
                    HStack{
                        Button(action:{
                            // Action pour le bouton play
                        }){
                            Image("icon_play")
                                .resizable()
                                .frame(width: 75, height: 75)
                                .padding()
                        }
                        Button(action:{
                            // Action pour le bouton manger
                            self.isFoodVisible.toggle()
                        }){
                            Image("icon_eat")
                                .resizable()
                                .frame(width: 75, height: 75)
                                .padding()
                        }
                        Button(action:{
                            // Action pour le bouton skins
                        }){
                            Image("icon_skins")
                                .resizable()
                                .frame(width: 75, height: 75)
                                .padding()
                        }
                    }
                    .frame(maxWidth: .infinity) //SUI couvre ecran mm zone de securité en bas
                }
                
                Circle()
                    .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
                    .frame(width: 10, height: 10)
                    .position(x: 213, y: 269.0)
                
                if isFoodVisible {
                    Image("chicken")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100, height: 100)
                        .position(chickenPosition)
                        .gesture(
                            DragGesture()
                                .onChanged { value in
                                    chickenPosition = value.location
                                }
                                .onEnded { _ in
                                    checkCollision()
                                }
                        )
                }
            }
            .navigationTitle("Niveau")
            .navigationBarItems(trailing:
                                    NavigationLink(destination: Text("Paramètres")) {
                Image(systemName: "gearshape.2.fill")
                    .accentColor(.black)
            })
            .navigationBarItems(trailing:
                                    NavigationLink(destination:
                                                    Text("Courses View")) {
                Image("coursbutton")
            })
        }
    }
    func checkCollision() {
        let dx = mouthPosition.x - chickenPosition.x
        let dy = mouthPosition.y - chickenPosition.y
        
        if abs(dx) <= 10 && abs(dy) <= 45 {
            level += 10
            isFoodVisible = false
        }
    }
    
    func distanceDescription() -> String {
        let dx = mouthPosition.x - chickenPosition.x
        let dy = mouthPosition.y - chickenPosition.y
        
        var description = ""
        
        if dx < 0 {
            description += "Déplacer vers la gauche de \(abs(dx).rounded()) points\n"
        } else {
            description += "Déplacer vers la droite de \(dx.rounded()) points\n"
        }
        
        if dy < 0 {
            description += "Déplacer vers le haut de \(abs(dy).rounded()) points"
        } else {
            description += "Déplacer vers le bas de \(dy.rounded()) points"
        }
        
        return description
    }
}

#Preview {
    LevelView()
}
