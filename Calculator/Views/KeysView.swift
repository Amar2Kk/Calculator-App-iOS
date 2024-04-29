//  KeysView.swift
//  Calculator
//
//  Created by Ammar Abbas on 28/04/2024.
//

import SwiftUI

struct KeysView: View {
    
    @State var value = "0"
    @State var runningNumber = 0
    @State var currentOperation: Operation = .none
    @State private var changeColor = false
    
    let buttons : [[Keys]] = [
        [.clear, .negative, .percent, .divide],
        [.seven, .eight, .nine, .multiply],
        [.four, .five, .six, .subtract],
        [.one, .two, .three, .add],
        [.zero, .decimal, .equal]
    ]
    
    var body: some View {
        VStack{
            Spacer()
            HStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(.white)
                    .frame(width: 350, height: 280)
                    .overlay(Text(value)
                        .bold()
                        .font(.system(size: 100))
                        .foregroundColor(.black)
                    )
            }.padding()
            ForEach(buttons, id: \.self){ row in
                HStack(spacing: 10){
                    ForEach(row, id: \.self){ elem in
                        Button {
                            self.onClick(button: elem)
                        } label: {
                            Text(elem.rawValue)
                                .font(.system(size: 40))
                                .frame(width: self.calcWidth(elem: elem), height: self.clacHeight(elem: elem))
                                .background(elem.buttonColor)
                                .foregroundColor(.black)
                                .cornerRadius(10)
                        }
                        
                    }
                }.padding(.bottom, 1)
            }
        }
    }
    
    func onClick(button: Keys){
        
        switch button {
        case .add, .subtract, .multiply, .divide, .equal:
            if button == .add {
                self.currentOperation = .add
                self.runningNumber = Int(self.value) ?? 0
            }
            else if button == .subtract {
                self.currentOperation = .subtract
                self.runningNumber = Int(self.value) ?? 0
            }
            else if button == .multiply {
                self.currentOperation = .multiply
                self.runningNumber = Int(self.value) ?? 0
            }
            else if button == .divide {
                self.currentOperation = .divide
                self.runningNumber = Int(self.value) ?? 0
            }
            else if button == .equal {
                let runningValue = self.runningNumber
                let currentValue = Int(self.value) ?? 0
                switch self.currentOperation {
                case .add:
                    self.value = "\(runningValue + currentValue)"
                case .subtract:
                    self.value = "\(runningValue - currentValue)"
                case .multiply:
                    self.value = "\(runningValue * currentValue)"
                case .divide:
                    self.value = "\(runningValue / currentValue)"
                case .none:
                    break
                }
            }
            if button != .equal {
                self.value = "0"
            }
        case .clear: self.value = "0"
        case .decimal:
            if !self.value.contains(".") {
                self.value += "."
            }
        case .negative:
            if let number = Double(self.value) {
                self.value = String(-number)
            }
        case .percent:
            if let number = Double(self.value) {
                self.value = String(number / 100)
            }
        default:
            let number = button.rawValue
            if self.value == "0" {
                value = number
            }
            else{
                self.value = "\(self.value)\(number)"
            }
        }
    }
    func calcWidth(elem:Keys) -> CGFloat {
        if elem == .zero {
            return (UIScreen.main.bounds.width - (3 * 10)) / 2
        }
        
        return (UIScreen.main.bounds.width - (5 * 10)) / 4
    }
    
    func clacHeight(elem: Keys) -> CGFloat {
        return (UIScreen.main.bounds.width - (5 * 10)) / 4
    }
    
}


#Preview {
    KeysView()
}

