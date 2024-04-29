//
//  SplashScreenView.swift
//  Calculator
//
//  Created by Ammar Abbas on 29/04/2024.
//

import SwiftUI

struct SplashScreenView: View {
    @State var isActive: Bool = false
    @State private var size = 0.7
    @State private var opacity = 0.4
    
    var body: some View {
        if isActive {
            KeysView()
        } else {
            VStack{
                Image("SplashLogo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150)
                    .foregroundColor(Color("Dark"))
                Text("Calculate Your Way to")
                    .font(.system(size: 30))
                    .foregroundStyle(Color("Dark"))
                Text("Precision")
                    .font(.system(size: 30))
                    .foregroundStyle(Color("Voperator"))
            }
            .scaleEffect(size)
            .opacity(opacity)
            .onAppear{
                withAnimation(.easeIn(duration: 1.0)){
                    self.size = 1.1
                    self.opacity = 1.0
                }
            }
            .onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now() + 3){
                    withAnimation{
                        self.isActive = true
                    }
                }
            }
        }
    }
}

#Preview {
    SplashScreenView()
}
