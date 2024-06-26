//
//  calculatorModel.swift
//  Calculator
//
//  Created by Ammar Abbas on 29/04/2024.
//

import Foundation
import SwiftUI

enum Keys: String{
    case one = "1"
    case two = "2"
    case three = "3"
    case four = "4"
    case five = "5"
    case six = "6"
    case seven = "7"
    case eight = "8"
    case nine = "9"
    case zero = "0"
    case add = "+"
    case subtract = "-"
    case divide = "÷"
    case multiply = "x"
    case equal = "="
    case clear = "AC"
    case decimal = "."
    case percent = "%"
    case negative = "-/+"
    
    var buttonColor:Color {
        switch self {
        case .add, .subtract, .multiply, .divide, .equal:
            return Color("Voperator")
        case .clear, .negative, .percent:
            return Color("Hoperator")
        default:
            return Color("NumKeys")
        }
    }
}


enum Operation {
    case add, subtract, multiply, divide, none
}
