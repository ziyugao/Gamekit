//
//  MoneyObject.swift
//  GameKit
//
//  Created by Ziyu Gao on 2/26/20.
//  Copyright © 2020 Mobile Lab. All rights reserved.
//

import SwiftUI

struct MoneyObject: View {
    var position: CGPoint
    var avatarPosition: CGPoint
    
    let size: CGFloat = 30
    
    // Logic to check if avatar is inside the collision object.
    func isAvatarInside() -> Bool {
        if (position.x - size / 2.0) < avatarPosition.x && avatarPosition.x < (position.x + size / 2.0) &&
            (position.y - size / 2.0) < avatarPosition.y && avatarPosition.y < (position.y + size / 2.0) {
                return true
            } else {
                return false
            }
        }
        
        var body: some View {
            ZStack {
                Image("money")
                .resizable()
                    .frame(width:40, height:40)
                    .opacity(isAvatarInside() ? 0.25 : 1.0)
            }
            .border(Color.purple, width: 2)
            .position(position)
        }
    }
    
    struct MoneyObject_Previews: PreviewProvider {
        static var previews: some View {
            GeometryReader { geometry in
                MoneyObject(position: CGPoint(x: geometry.size.width / 2, y:  geometry.size.height / 2), avatarPosition: CGPoint(x: 0, y: 0))
            }
        }
}
