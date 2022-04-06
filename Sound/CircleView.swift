//
//  CircleView.swift
//  Sound
//
//  Created by Martina Esposito on 05/04/22.
//

import SwiftUI

struct CircleView: View {
   
   var color : Color = .white
   var count : Int
   @Binding var tap: Bool
   
   @State private var animateGradient = false
   
       var body: some View {
           ZStack{
               
               Circle()
                   .fill(
                       RadialGradient(colors: [tap == false || (tap == true && count > 4) ? .white : color, .white], center: .center, startRadius: animateGradient ? 100 : 0.5, endRadius: animateGradient ? 0.2 : 0.5)
                   )
               
               if tap && color == .black{
               
               Circle()
                   .stroke(Color.white, lineWidth: 5)
                   .frame(width: 320, height: 320)
               }
           }
           .ignoresSafeArea()
           .onAppear {
               withAnimation(.linear(duration: 3.0).repeatForever(autoreverses: true)) {
                   animateGradient.toggle()
               }
           }
       }
}

