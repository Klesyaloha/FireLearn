//
//  LevelView.swift
//  FireLearn
//
//  Created by Apprenant 160 on 04/06/2024.
//

import SwiftUI

struct LevelView: View {
    
    var level : Double = 50
    var levelName : String = "Jeune Dragon"
    var body: some View {
        ZStack {
            LinearGradient(colors: [Color("firered"),Color("fireorange")], startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            VStack {
                HStack {
                    ProgressView(value: level, total: 100)
                                .scaleEffect(y : 10)
                                .frame(width: 300, height: 100)
                                .accentColor(.black)
                    Text("\(Int(level))%")
                        .bold()
                }
                .padding(.bottom, -10.0)
                Text(levelName)
                    
                Image("dragontestpng")
            
                HStack {
                    Spacer()
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Image("gamebutton")
                    })
                    Spacer()
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Image("lunchbutton")
                    })
                    Spacer()
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Image("costumebutton")
                    })
                    Spacer()
                }
            }
        }
    }
}

#Preview {
    LevelView()
}
