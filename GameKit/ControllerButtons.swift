//
//  Controller.swift
//  GameKit
//
//  Created by Nien Lam on 2/20/20.
//  Copyright © 2020 Mobile Lab. All rights reserved.
//

import SwiftUI

struct ControllerButtons: View {
    @Binding var avatarPosition: CGPoint
    
    var body: some View {
        HStack {
            Button(action: {
                self.avatarPosition.x -= 20
            }) {
                Text("Left")
                    .bold()
                    .font(.system(size: 14))
                    
                    .frame(width: 100, height: 44)
                    .background(Color.white)
                    .foregroundColor(Color.black)
                    .cornerRadius(30)
            }
            .buttonStyle(MyButtonStyle())
            
            Spacer();
            
            Button(action: {
                self.avatarPosition.x += 20
            }) {
                Text("Right")
                    .bold()
                    .font(.system(size: 14))
                    .frame(width: 100, height: 44)
                    .background(Color.white)
                    .foregroundColor(Color.black)
                    .cornerRadius(30)
            }
            .buttonStyle(MyButtonStyle())
        }
        .padding()
        //        .border(Color.black, width: 3)
    }
}

struct MyButtonStyle: PrimitiveButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .onLongPressGesture(
                minimumDuration: 0,
                perform: configuration.trigger
        )
    }
}


struct ControllerButtons_Previews: PreviewProvider {
    static var previews: some View {
        ControllerButtons(avatarPosition: .constant(CGPoint(x: 0, y: 0)))
    }
}
