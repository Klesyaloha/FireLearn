//
//  ModuleListView.swift
//  FireLearn
//
//  Created by Apprenant 167 on 05/06/2024.
//

import SwiftUI

struct ModuleListView: View {
    var progress : CGFloat
    var modules: [Module] = ModuleList.listOfModules
    
    var body: some View {
        NavigationStack {
            ZStack {
                Image("fondModule")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                
                VStack {
                    HStack {
                        NavigationLink(destination: SettingsView()) {
                            Image("settings")
                                .resizable()
                                .frame(width: 35, height: 35)
                                .cornerRadius(25)
                                .shadow(radius: 10)
                                .padding(.leading, 10)
                        }
                        
                        Spacer()
                        
                        Text("Cours")
                            .font(.largeTitle)
                            .bold()
                            .padding(55)
                        
                        Spacer()
                        
                        NavigationLink(destination: TamagoDragonView(progress: progress)
                            .navigationBarBackButtonHidden()) {
                            Image("icon_tamago")
                                .resizable()
                                .frame(width: 35, height: 35)
                                .cornerRadius(25)
                                .shadow(radius: 10)
                                .padding(.trailing, 10)
                        }
                    }
                    ZStack {
                        TextField("Search", text: .constant(""))
                            .padding()
                            .background(
                                LinearGradient(colors: [Color.yellow, Color.orange], startPoint: .leading, endPoint: .trailing)
                                    .opacity(0.8))
                            .cornerRadius(25)
                            .padding([.leading, .trailing], 20)
                    }
                    .padding(.top, -50)
                    
                    ScrollView {
                        LazyVStack(spacing: 20) {
                            ForEach(modules, id: \.id) { module in
                                NavigationLink(destination: ModuleDetailView(module: module)) {
                                    VStack(alignment: .leading, spacing: 10) {
                                        Image(module.imageName)
                                            .resizable()
                                            .scaledToFill()
                                            .frame(height: 140)
                                            .frame(width: UIScreen.main.bounds.width * 0.85)
                                            .cornerRadius(15)
                                            .clipped()
                                        
                                        Text(module.title)
                                            .font(.title2)
                                            .fontWeight(.semibold)
                                        
                                        Text(module.description)
                                            .font(.subheadline)
                                            .foregroundColor(.black)
                                    }
                                    .padding()
                                    .background(Color(red: 1.0, green: 0.941, blue: 0.808)) // Couleur #FFF0CE
                                    .cornerRadius(15)
                                    .shadow(radius: 5)
                                    .padding([.leading, .trailing], 10)
                                }
                                .buttonStyle(PlainButtonStyle())
                            }
                        }
                    }
                    .background(Color.clear)
                }
            }
        }
    }
}

struct ModuleListView_Previews: PreviewProvider {
    static var previews: some View {
        ModuleListView(progress: 50)
    }
}
