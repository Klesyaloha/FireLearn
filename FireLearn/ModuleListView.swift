//
//  ModuleListView.swift
//  FireLearn
//
//  Created by Apprenant 167 on 05/06/2024.
//

import SwiftUI
import SwiftData

struct ModuleListView: View {
    
    var modules: [Module] = ModuleList.listOfModules
    
    var body: some View {

            NavigationStack{
                List(modules, id: \.id) { module in
                    
                    VStack(alignment: .leading, spacing: 20) {
                        Image(module.imageName)
                            .resizable()
                            .frame(width: 350 ,height: 240)
                            .cornerRadius(15)
                        
                        VStack {
                            Text(module.title)
                                .font(.title)
                                .fontWeight(.semibold)
                                .lineLimit(2)
                                .minimumScaleFactor(0.5)
                            
                            Text(module.description)
                                .font(.title2)
                                .multilineTextAlignment(.center)
                            
                        }
                    }
                    
                }
             .navigationTitle("Cours")
             }
             
             
        }
        
    }


#Preview {
    ModuleListView()
}
