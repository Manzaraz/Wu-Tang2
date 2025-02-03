//
//  ContentView.swift
//  Wu-Tang2
//
//  Created by Christian Manzaraz on 03/02/2025.
//

import SwiftUI

struct ContentView: View {
    @State private var enteredName = ""
    @State private var staticCoderNamels = ""
    @State private var wuTangName = "Undefined Breakpoint"
    @State private var imageName = "wu-tang"
    @FocusState private var isFocused: Bool
    
    private let firstColumn = ["Algorithmic","Byte","Cache","Debug","Echo", "Function", "Git", "Hex", "Infinite", "Java", "Kernel", "Logic", "Module", "Node", "Object", "Pixel", "Query", "Runtime", "Script", "Token", "Undefined", "Virtual", "Web", "Xcode", "Yota", "Zero" ]
    
    private let secondColumn = ["$tack", "Processor", "Cipher", "Daemon", "EndPoint", "Framework", "Gateway", "Hub", "Interrupt", "Crash", "Loop", "Module", "Nexus", "Optimizer", "Protocol", "Queue", "Router", "Stack", "Thread", "Update", "Variable", "Widget", "Terminal", "Yield", "Zen", "Ace", "Breakpoint", "Root", "Instance", "Access", "Archive", "Control", "Justice" ]
    
    var body: some View {
        VStack {
            Text("Wu-Tang\nCoder Name Generator")
        }
        .font(.system(.title, weight: .black))
        .foregroundStyle(.yellow)
        .multilineTextAlignment(.center)
        .frame(maxWidth: .infinity)
        .padding(.bottom)
        .padding(.horizontal)
        .background(.black)
        
        Spacer()

        TextField("Enter name here", text: $enteredName)
            .font(.title2)
            .textFieldStyle(.roundedBorder)
            .overlay {
                RoundedRectangle(cornerRadius: 5)
                    .stroke(.gray, lineWidth: 1)
            }
            .padding()
            .autocorrectionDisabled()
            .textInputAutocapitalization(.words)
            .focused($isFocused)
            .onChange(of: isFocused) { // isFocus Changes when keyboard toggles
                if isFocused == true { // if Keyboard shows
                    imageName = ""
                    enteredName = ""
                    staticCoderNamels = ""
                    wuTangName = ""
                }
            }
        
        Button {
            wuTangName = getWuTangName(name: enteredName)
            isFocused = false
            staticCoderNamels = "Your Wu-Tang Coder Nameis:"
            imageName = "wu-tang"
            
        } label: {
            Image("wu-tang-button")
            Text("Get It!")
        }
        .font(.system(.title2, weight: .bold))
        .foregroundStyle(.yellow)
        .buttonStyle(.borderedProminent)
        .tint(.black)
        .disabled(enteredName.isEmpty)
        
        .foregroundStyle(.yellow)

        VStack {
            Text(staticCoderNamels)
                .multilineTextAlignment(.leading)
            Text(wuTangName)
                .fontWeight(.black)
                .multilineTextAlignment(.center)
        }
        .font(.largeTitle)
        .frame(height: 130)

        Spacer()
        
        Image(imageName)
            .resizable()
            .scaledToFit()
        
    }
        
    func getWuTangName(name: String) -> String {
        var localName = name
        let firstLetter = localName.removeFirst()
        print("firstLetter = \(firstLetter )")
        var firstColumnIndex = 0
        // Loop through all elements of firstcolumn and compare first letters
        for i in 0..<firstColumn.count {
            if firstColumn[i].first?.uppercased() == firstLetter.uppercased() {
                firstColumnIndex = i == 0 ? 25 : i-1
            }
        }
        
        return "\(firstColumn[firstColumnIndex]) \(secondColumn.randomElement()!)"
    }
}

#Preview {
    ContentView()
}
