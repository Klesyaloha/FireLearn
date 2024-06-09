//
//  ModuleDetailView.swift
//  FireLearn
//
//  Created by Apprenant 167 on 05/06/2024.
//

import SwiftUI

struct ModuleDetailView: View {
    
    var course: [String] = ["Variables, constants, strings, and numbers", "Booleans, string interpolation", "Arrays, dictionaries, sets, and enums", "Type annotations", "If, switch, and the ternary operator", "Loops", "Functions, parameters, and return values", "Default values, throwing functions", "Structs, computed properties, and property observers", "Access control, static properties and methods", "Classes, inheritance", "Protocols, extensions", "Optionals, nil coalescing",]
    var module: Module
    
    var body: some View {
        NavigationStack {
<<<<<<< HEAD
            ZStack {
                Image("fondModuleDV")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                    .opacity(0.8)
                
                VStack {
                    // Affichage de l'image du module
                    Image(module.imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                        .padding(.top, 20)
                    
                    // Titre du module
                    Text(module.title)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(.top, -15)
                        .foregroundColor(.red)
                    
                    // Petit sous-texte
                    Text("Track your \(module.title) learning")
                        .font(.subheadline)
                    
                    // Champ de recherche
                    TextField("Search", text: .constant(""))
                        .padding()
                        .background(
                            LinearGradient(colors: [Color.yellow, Color.orange], startPoint: .leading, endPoint: .trailing)
                                .opacity(0.8))
                        .cornerRadius(25)
                        .padding([.leading, .trailing], 20)
                        .padding(.top, -5)
                    
                    // ScrollView avec LazyVStack pour la liste des cours
                    ScrollView {
                        LazyVStack(spacing: 0) {
                            ForEach(0..<course.count, id: \.self) { index in
                                VStack {
                                    NavigationLink(destination: QuizzView()) {
                                        HStack {
                                            Image(systemName: "circle")
                                                .foregroundColor(.gray)
                                            
                                            VStack(alignment: .leading) {
                                                Text(course[index])
                                                    .font(.headline)
                                                Text(course[index])
                                                    .font(.subheadline)
                                                    .foregroundColor(.gray)
                                            }
                                            
                                            Spacer()
                                        }
                                        .padding()
                                        .background(Color.clear)
                                    }
                                    .buttonStyle(PlainButtonStyle())
                                    
                                    // Ligne noire de division
                                    Divider()
                                        .background(Color.black)
                                        .padding(.leading, 45)
                                }
                            }
                        }
                        .padding()
                        .background(Color(red: 1.0, green: 0.941, blue: 0.808)) // Couleur #FFF0CE en mode RGB
                        .cornerRadius(10)
                        .padding([.leading, .trailing], 10)
                    }
                }
                .padding(.bottom, 20) // Ajout d'un padding en bas
            }
        }
    }
}

=======
            VStack {
                Image(module.imageName)
                 .resizable()
                 .frame(width: 500 ,height: 340)
                 .cornerRadius(10)
                 .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                 
                    
                Text(module.title)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .padding(-60)
                 
                List {
                    Text("1) Variables, constants, strings, and numbers")
                    Text("2) Booleans, string interpolation")
                    Text("3) Arrays, dictionaries, sets, and enums")
                    Text("4) Type annotations")
                    Text("5) If, switch, and the ternary operator")
                    Text("6) Loops")
                    Text("7) Functions, parameters, and return values")
                    Text("8) Default values, throwing functions")
                    Text("9) Closures, passing functions into functions")
                    Text("10) Structs, computed properties, and property observers")
                    Text("11) Access control, static properties and methods")
                    Text("12)Classes, inheritance")
                    Text("13) Protocols, extensions")
                    Text("14) Optionals, nil coalescing")
                }
                .listStyle(PlainListStyle())
                
                
            }
        }

        
        
        
    }
    
}

        


>>>>>>> Klesya
#Preview {
    ModuleDetailView(module: ModuleList.listOfModules.first!)
}
