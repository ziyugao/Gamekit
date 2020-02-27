//
//  ContentView.swift
//  GameKit
//
//  Created by Nien Lam on 2/20/20.
//  Copyright © 2020 Mobile Lab. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var avatarPosition: CGPoint = .zero
    @State var gameHasEnded = false
    
    var body: some View {
        GeometryReader { geometry in
            Color.white
            
            ZStack {
                GameBoard(avatarPosition: self.avatarPosition)
                
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        ControllerButtons(avatarPosition: self.$avatarPosition)
                        Spacer()
                    }
                    .padding()
                }
            }
            .onAppear() {
                // Initialize position to center of the screen.
                self.avatarPosition = CGPoint(x: geometry.size.width / 2, y: geometry.size.height - 40)
            }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
