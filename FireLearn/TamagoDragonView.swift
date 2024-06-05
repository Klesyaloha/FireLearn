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
    var percent: CGFloat = 60
    var color1 = Color.yellow
    var color2 = Color.red
    var dragonLevelName = ["Bébé Dragon", "Mini Dragon", "Jeune Dragon", "Maître Dragon"]
    
    @State private var dragonId: String = ""
    //SUI var  mutable et reactive peut changer ds le tps et declencher maj interface utilisateur
    var newDragonName: String {
        switch percent{
        case 0...25:
            dragonId = ("bebeDragon")
            return dragonLevelName[0]
        case 26...50:
            dragonId = ("miniDragon")
            return dragonLevelName[1]
        case 51...75:
            dragonId = ("jeuneDragon")
            return dragonLevelName[2]
        default:
            dragonId = ("maitreDragon")
            return dragonLevelName[3]
        }
    }
    
    var body: some View {
        let multiplier = width / 100
        
        VStack{
            Text("NIVEAU")
                .bold()
                .padding()
            
            ZStack(alignment: .leading){
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .frame(width: width, height: height)
                    .foregroundColor(Color.black.opacity(0.1))
                    .padding(.leading, 15)
                
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .frame(width: multiplier * percent, height: height)
                    .background(
                        LinearGradient(colors: [color1, color2], startPoint: .leading, endPoint: .trailing)
                            .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                    )
                    .foregroundColor(.clear)
                    .padding(.leading, 15) // Ajout du padding à gauche
                HStack{
                    Spacer()
                    Text("\(Int(percent)) %")
                    .bold()
                    .padding(.trailing, 15)
                }
            }
            
            Text(newDragonName)
                .bold()
                .padding()
            
            Image(dragonId)
                .resizable()
                .scaledToFit()
        
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
        .edgesIgnoringSafeArea(.bottom)
        .onAppear {
                    _ = newDragonName //SUI pour pouvoir executer le code inclus lorsque la view apparait et tt generer
                }
      }
}

#Preview {
    TamagoDragonView()
}
