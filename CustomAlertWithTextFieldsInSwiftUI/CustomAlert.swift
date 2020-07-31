//
//  CustomAlert.swift
//  CustomAlertWithTextFieldsInSwiftUI
//
//  Created by ramil on 31.07.2020.
//

import SwiftUI

struct CustomAlert: View {
    
    let screenSize = UIScreen.main.bounds
    
    @Binding var isShown: Bool
    @Binding var text: String
    
    var title: String = "Add some item"
    
    var onDone: (String) -> Void = { _ in }
    var onCancel: () -> Void = { }
    
    var body: some View {
        VStack {
            Text(title)
            TextField("", text: $text)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            HStack {
                Button("Done") {
                    isShown = false
                    onDone(text)
                }
                Spacer()
                Button("Cancel") {
                    isShown = false
                    onCancel()
                }
            }
        }
        .padding()
        .frame(width: screenSize.width * 0.7, height: screenSize.height * 0.3)
        .background(Color("Color"))
        .clipShape(RoundedRectangle(cornerRadius: 20.0, style: .continuous))
        .offset(y: isShown ? 0 : screenSize.height)
        .animation(.spring())
        .shadow(radius: 2)
    }
}

struct CustomAlert_Previews: PreviewProvider {
    static var previews: some View {
        CustomAlert(isShown: .constant(true), text: .constant(""))
    }
}
