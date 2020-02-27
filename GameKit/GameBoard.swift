//
//  GameBoard.swift
//  GameKit
//
//  Created by Nien Lam on 2/20/20.
//  Copyright © 2020 Mobile Lab. All rights reserved.
//

import SwiftUI

struct GameBoard: View {
    var avatarPosition: CGPoint
    @State var collisionObjectPositions: [(CGPoint, CGFloat)] = {
        var positions = [(CGPoint, CGFloat)]()
        for i in 0..<6 {
            let pos = CGPoint(
                x: Int.random(in: 0..<Int(UIScreen.main.bounds.width)),
                y: 0
            )
            let speed = CGFloat.random(in: 3..<6)
            positions.append((pos, speed))
        }
        return positions
    }()
    
    let timer = Timer.publish(every: 1/60, on: .main, in: .common).autoconnect()
    
    let scoreText = 0;
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Image("wallpaper")
                    .resizable()
                    .aspectRatio(contentMode:.fill);
                
                Text("Score: " + String(self.scoreText))
                    .bold()
                    .font(.system(.title, design: .monospaced))
                    .frame(width: 150, height: 44)
                    .foregroundColor(Color.black)
                    .position(x:geometry.size.width / 2, y:geometry.size.height-710)
                
                //isAvatarInside
                
                // Place avatar.
                Avatar(position: self.avatarPosition)
                
                // Collision Objectsx
                ForEach(0..<self.collisionObjectPositions.count) { i in
                    CollisionObject(
                        position: self.collisionObjectPositions[i].0,
                        avatarPosition: self.avatarPosition
                    )
                }
                
                
                
                
                
                
            }
            .edgesIgnoringSafeArea(.all)
            .onReceive(self.timer) { input in
                for i in 0..<self.collisionObjectPositions.count {
                    let tuple = self.collisionObjectPositions[i]
                    let pos = tuple.0
                    let speed = tuple.1
                    
                    if (pos.y > geometry.size.height) {
                        let newPos = CGPoint(
                            x: CGFloat.random(in: 0..<geometry.size.width),
                            y: 0
                        )
                        let newSpeed = CGFloat.random(in: 3..<6)
                        self.collisionObjectPositions[i] = (newPos, newSpeed)
                    } else {
                        self.collisionObjectPositions[i] = (CGPoint(x: pos.x, y: pos.y + speed), speed)
                    }
                }
            }
            
        }
    }
}

struct GameBoard_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { geometry in
            GameBoard(avatarPosition: CGPoint(x: geometry.size.width / 2, y: geometry.size.height / 2))
        }
    }
}
