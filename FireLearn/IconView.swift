//
//  IconView.swift
//  FireLearn
//
//  Created by Nouha Achouri on 04/06/2024.
//

import SwiftUI

struct IconView: View {
    var imageName: String
    var label: String
    
    var body: some View {
        VStack {
            Image(imageName)
                .resizable()
                .frame(width: 50, height: 50)
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                .shadow(radius: 5)
            
            Text(label)
                .font(.caption)
                .foregroundColor(.black)
        }
    }
}

struct IconView_Previews: PreviewProvider {
    static var previews: some View {
        IconView(imageName: "AppIcon", label: "FireLearn")
    }
}
