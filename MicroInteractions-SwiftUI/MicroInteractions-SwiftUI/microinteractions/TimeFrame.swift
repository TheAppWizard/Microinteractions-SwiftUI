//
//  TimeFrame.swift
//  MicroInteractions-SwiftUI
//
//  Created by Shreyas Vilaschandra Bhike on 22/12/24.
//


import SwiftUI

struct TimeFrame: View {
    var body: some View {
        ZStack{
            Color.black.edgesIgnoringSafeArea(.all)
            FinalView()
        }
    }
}


struct FinalView: View {
    @State private var needle = false
   
    var body: some View {
        ZStack {
            VStack {
                Spacer().frame(height: 75)
                Needle()
            }
            .rotationEffect(.degrees(needle ? 0 : -180))
            .animation(
                .easeInOut(duration: 4)
                .repeatForever(autoreverses: true),
                value: needle
            )
            .onAppear() {
                self.needle.toggle()
            }
            BackgroundCircle()
        }
    }
}


struct Needle: View {
    var body: some View {
        VStack(spacing:0){
            Circle()
                .frame(width: 20,height: 20)
                .foregroundStyle(.white)
            
            RoundedRectangle(cornerRadius: 5)
                .frame(width: 5,height: 70)
                .foregroundStyle(.white)
                .offset(y:-5)
            
        }
    }
}



struct BackgroundCircle : View {
    @State private var outerFrame = false
    var body: some View {
        Circle()
          .trim( from: 0, to: 1)
          .stroke(Color.gray.opacity(0.2), style: StrokeStyle(lineWidth: 20, lineCap: .round))
          .frame(width: 180, height: 180, alignment: .center)
        
        
        Circle()
        .trim( from: 0.2, to: outerFrame  ?  0.7 :  0.2)
        .stroke(Color.white,style: StrokeStyle(lineWidth: 10, lineCap: .round))
        .frame(width: 180, height: 180, alignment: .center)
        .rotationEffect(.degrees(198))
        .animation(
            .easeInOut(duration: 4)
            .repeatForever(autoreverses: true),
            value: outerFrame
        )
        .onAppear() {
                outerFrame.toggle()
        }
    }
}



#Preview {
    TimeFrame()
}
