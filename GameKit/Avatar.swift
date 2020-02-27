//
//  Avatar.swift
//  GameKit
//
//  Created by Nien Lam on 2/20/20.
//  Copyright © 2020 Mobile Lab. All rights reserved.
//

import SwiftUI

struct Avatar: View {
    var position: CGPoint
    
    var body: some View {
        ZStack {
            
            Image("girl")
                .resizable()
        }   
        .frame(width: 70, height: 70)
        .position(position)
        .animation(.easeInOut(duration: 0.2))
        
    }
}

struct Avatar_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { geometry in
            Avatar(position: CGPoint(x: geometry.size.width / 2, y:  geometry.size.height / 2))
        }
    }
}
