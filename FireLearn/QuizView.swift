//
//  QuizView.swift
//  FireLearn
//
//  Created by Klesya Loha on 09/06/2024.
//

import SwiftUI

struct QuizView: View {
    var body: some View {
        ZStack {
            Image("quizFond")
                .resizable()
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                .blur(radius: /*@START_MENU_TOKEN@*/4.0/*@END_MENU_TOKEN@*/)
                .opacity(0.4)
            VStack {
                Text("Swift")
                    .multilineTextAlignment(.leading)
                    .bold()
                    .font(.title)
                    
                Text("Variables, constants, strings and numbers")
                    .fontWeight(.semibold)
                Text("Quiz")
                Spacer()
                Image("quizCode")
                    .resizable()
                    .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                    .frame(height: 67)
                    .cornerRadius(/*@START_MENU_TOKEN@*/8.0/*@END_MENU_TOKEN@*/)
                    .padding(.top, -102.0)
                Spacer()
                Text("Quelle sera la valeur de la variable ’message’ après l'exécution du code suivant ?")
                    .foregroundColor(Color(red: 0.0, green: 0.6352941176470588, blue: 0.7843137254901961))
                    .multilineTextAlignment(.center)
                    .bold()
                    .padding(.top, -159.0)
                HStack {
                    Text("‘Hello, the result is 10’")
                        .foregroundColor(Color.white)
                        .frame(width: 180.0,height: 54)
                        .background(Color(red: 0.0, green: 0.6352941176470588, blue: 0.7843137254901961))
                        .cornerRadius(/*@START_MENU_TOKEN@*/10.0/*@END_MENU_TOKEN@*/)
                    Text("‘Hello, the result is 5’")
                        .foregroundColor(Color.white)
                        .frame(width: 180,height: 54)
                        .background(Color(red: 0.0, green: 0.6352941176470588, blue: 0.7843137254901961))
                        .cornerRadius(/*@START_MENU_TOKEN@*/10.0/*@END_MENU_TOKEN@*/)
                }
                HStack {
                    Text("‘Hello, the result is 20’")
                        .foregroundColor(Color.white)
                        .frame(width: 180.0,height: 54)
                        .background(Color(red: 0.0, green: 0.6352941176470588, blue: 0.7843137254901961))
                        .cornerRadius(/*@START_MENU_TOKEN@*/10.0/*@END_MENU_TOKEN@*/)
                    Text("‘Hello, the result is 15’")
                        .foregroundColor(Color.white)
                        .frame(width: 180,height: 54)
                        .background(Color(red: 0.0, green: 0.6352941176470588, blue: 0.7843137254901961))
                        .cornerRadius(/*@START_MENU_TOKEN@*/10.0/*@END_MENU_TOKEN@*/)
                }
                Spacer()
                HStack {
                    Spacer()
                    Image(systemName: "timer")
                    Text("10s")
                    Spacer()
                    Text("🔥4")
                        .foregroundColor(/*@START_MENU_TOKEN@*/Color("AccentColor")/*@END_MENU_TOKEN@*/)
                    Spacer()
                }
            }
        }
    }
}

#Preview {
    QuizView()
}
