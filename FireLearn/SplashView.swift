//
//  SplashView.swift
//  FireLearn
//
//  Created by Nouha Achouri on 07/06/2024.
//

import SwiftUI

struct AnimatedImageView: View {
    @State private var currentFrame = 0
    @Binding var animationFinished: Bool
    // binding pour mettre à jour l'état quand l'animation se termine
    private let frameCount = 8
    private let frameRate = 0.8

    private let imageNames = (1...8).map { "dragon_fire_frame_\($0)" }
    
    var body: some View {
        Image(imageNames[currentFrame])
            .resizable()
            .scaledToFit()
            .onAppear {
                Timer.scheduledTimer(withTimeInterval: frameRate, repeats: true) { timer in
                    if currentFrame < frameCount - 1 {
                        currentFrame += 1
                    } else {
                        timer.invalidate()
                        animationFinished = true // L'animation est terminée
                    }
                }
            }
    }
}

struct SplashView: View {
    @State private var animationFinished = false
    
    var body: some View {
        VStack {
            if animationFinished {
                // Afficher TDV lorsque l'animation est terminée
                TamagoDragonView()
            } else {
                AnimatedImageView(animationFinished: $animationFinished)
                    .frame(width: 900, height: 900)
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}



#Preview {
    SplashView()
}
