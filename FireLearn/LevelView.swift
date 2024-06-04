//
//  LevelView.swift
//  FireLearn
//
//  Created by Apprenant 160 on 04/06/2024.
//

import SwiftUI

struct LevelView: View {
    
    @State var level : Double = 50
    @State var levelName : String = "Jeune Dragon"
    
    func levelChange() {
        switch level {
            case 0...20:
                levelName = "Jeune Dragon"
            case 20...50:
                levelName = "Dragon Apprenti"
            case 50...70:
                levelName = "Guerrier Dragon"
            case 70...100:
                levelName = "Dragon Légendaire"
        default:
            levelName = "Default"
        }
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(colors: [Color("firered"),Color("fireorange")], startPoint: .top, endPoint: .bottom)
                        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
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
                    
                        
                    Text(levelName)
                        .onChange(of: level) { levelChange() }
                        .bold()
                    
                        Stepper(value: $level, in: 0...100, step: 10) { Text("")}
                            .labelsHidden()
                    


                    
                    Image("dragontestpng")
                
                    HStack {
                        Spacer()
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            Image("jeuxbutton")
                        })
                        Spacer()
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            Image("miambutton")
                        })
                        Spacer()
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            Image("skinbutton")
                        })
                        Spacer()
                    }
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
}

#Preview {
    LevelView()
}
