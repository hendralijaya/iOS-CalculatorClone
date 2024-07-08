//
//  ContentView.swift
//  CalculatorClone
//
//  Created by hendra on 08/07/24.
//

import SwiftUI

struct CalculatorButton: Identifiable, Hashable {
    let id = UUID()
    var title: String?
    var icon: String?
    var size: Int = 1
    var color: Color = .blackButton
    var colorText: Color = .white
}

struct ContentView: View {
    @State private var display: String = "0"
    @State private var currentOperation: String? = nil
    @State private var firstOperand: Double? = nil
    @State private var shouldResetDisplay: Bool = false
    
    let buttonTitles: [[CalculatorButton]] = [
        [CalculatorButton(title: "AC", color: .gray, colorText: .black),
         CalculatorButton(icon: "plus.forwardslash.minus", color: .gray, colorText: .black),
         CalculatorButton(icon: "percent", color: .gray, colorText: .black),
         CalculatorButton(icon: "divide", color: .orange)],
        [CalculatorButton(title: "7"),
         CalculatorButton(title: "8"),
         CalculatorButton(title: "9"),
         CalculatorButton(icon: "multiply", color: .orange)],
        [CalculatorButton(title: "4"),
         CalculatorButton(title: "5"),
         CalculatorButton(title: "6"),
         CalculatorButton(icon: "minus", color: .orange)],
        [CalculatorButton(title: "1"),
         CalculatorButton(title: "2"),
         CalculatorButton(title: "3"),
         CalculatorButton(icon: "plus", color: .orange)],
        [CalculatorButton(title: "0", size: 2),
         CalculatorButton(title: ","),
         CalculatorButton(icon: "equal", color: .orange)]
    ]
    
    var body: some View {
        GeometryReader { geometry in
            let dynamicSpacerHeight = geometry.size.height * 0.18
            
            ZStack {
                Color.black.ignoresSafeArea()
                VStack {
                    Spacer(minLength: dynamicSpacerHeight)
                    HStack {
                        Spacer()
                        Text(display)
                            .foregroundColor(.white)
                            .font(.system(size: 80))
                            .padding()
                            .lineLimit(1)
                            .minimumScaleFactor(0.5)
                    }
                    GeometryReader { innerGeometry in
                        let buttonWidth = (innerGeometry.size.width - 50) / 4
                        let buttonHeight = buttonWidth
                        
                        VStack(spacing: 10) {
                            ForEach(buttonTitles, id: \.self) { row in
                                HStack(spacing: 10) {
                                    ForEach(row) { button in
                                        Button(action: {
                                            
                                        }) {
                                            if button.title == "AC" {
                                                Text("AC")
                                                    .frame(width: button.size == 2 ? buttonWidth * 2 + 10 : buttonWidth, height: buttonHeight)
                                                    .font(.system(size: 32))
                                                    .foregroundColor(button.colorText)
                                                    .background(
                                                        Group {
                                                            if button.size == 2 {
                                                                Capsule().fill(button.color)
                                                            } else {
                                                                Circle().fill(button.color)
                                                            }
                                                        }
                                                    )
                                            } else if let title = button.title {
                                                Text(title)
                                                    .frame(width: button.size == 2 ? buttonWidth * 2 + 10 : buttonWidth, height: buttonHeight)
                                                    .font(.system(size: 32))
                                                    .foregroundColor(button.colorText)
                                                    .background(
                                                        Group {
                                                            if button.size == 2 {
                                                                Capsule().fill(button.color)
                                                            } else {
                                                                Circle().fill(button.color)
                                                            }
                                                        }
                                                    )
                                            } else if let iconName = button.icon {
                                                Image(systemName: iconName)
                                                    .frame(width: buttonWidth, height: buttonHeight)
                                                    .font(.system(size: 32))
                                                    .foregroundColor(currentOperation == iconName ? button.color : button.colorText)
                                                    .background(
                                                        Circle().fill(currentOperation == iconName ? button.colorText : button.color)
                                                    )
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        .padding(10)
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}

