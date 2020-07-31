//
//  ContentView.swift
//  CustomAlertWithTextFieldsInSwiftUI
//
//  Created by ramil on 31.07.2020.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isPresented: Bool = false
    @State private var text: String = ""
    @State private var textFromClosure: String = ""
    
    var body: some View {
        ZStack {
            VStack {
                Text(text)
                Button("Show alert") {
                    isPresented = true
                }
                Text(textFromClosure)
            }.padding()
            
            CustomAlert(isShown: $isPresented, text: $text, onDone: { text in
                textFromClosure = text
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
