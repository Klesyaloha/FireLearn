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
                    HStack{
                        Image(systemName: "checkmark.circle")
                        Text("1) Variables, constants, strings, and numbers")
                    }
                    
                    HStack{
                        Image(systemName: "checkmark.circle")
                        Text("2) Booleans, string interpolation")
                    }
                    
                    HStack {
                        Image(systemName: "checkmark.circle")
                        Text("3) Arrays, dictionaries, sets, and enums")
                    }
                    HStack {
                        Image(systemName: "checkmark.circle")
                        Text("4) Type annotations")
                    }
                    HStack {
                        Image(systemName: "checkmark.circle")
                        Text("5) If, switch, and the ternary operator")
                    }
                    HStack {
                        Image(systemName: "checkmark.circle")
                        Text("6) Loops")
                    }
                    HStack {
                        Image(systemName: "checkmark.circle")
                        Text("7) Functions, parameters, and return values")
                    }
                    HStack {
                        Image(systemName: "checkmark.circle")
                        Text("8) Default values, throwing functions")
                    }
                    HStack {
                        Image(systemName: "checkmark.circle")
                        Text("9) Closures, passing functions into functions")
                    }
                    HStack {
                        Image(systemName: "checkmark.circle")
                        Text("10) Structs, computed properties, and property observers")
                    }
                    HStack {
                        Image(systemName: "checkmark.circle")
                        Text("11) Access control, static properties and methods")
                    }
                    HStack {
                        Image(systemName: "checkmark.circle")
                        Text("12)Classes, inheritance")
                    }
                    HStack {
                        Image(systemName: "checkmark.circle")
                        Text("13) Protocols, extensions")
                    }
                    HStack {
                        Image(systemName: "checkmark.circle")
                        Text("14) Optionals, nil coalescing")
                    }
                }
                .listStyle(PlainListStyle())
                
                
            }
        }
        
        
        
        
    }
    
}

        


#Preview {
    ModuleDetailView(module: ModuleList.listOfModules.first!)
}
