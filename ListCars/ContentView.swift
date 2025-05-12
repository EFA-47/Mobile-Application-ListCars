//
//  ContentView.swift
//  ListCars
//
//  Created by Emir Fatih AYYILDIZ on 8.01.2024.
//

import SwiftUI
import Firebase

struct ContentView: View {

    @State private var email = ""
    @State private var password = ""
    @State private var UserIsLoggedIn = false

    var body: some View {
        if UserIsLoggedIn{
            HomeView()
        }else{
            content
        }
    }

    var content: some View {
        ZStack {
            Color.black

            RoundedRectangle(cornerRadius: 30, style: .continuous)
                .foregroundStyle(.linearGradient(colors: [.white,.blue], startPoint: .topLeading, endPoint: .bottomTrailing))
                .frame(width: 1000, height: 1000)
                .rotationEffect(.degrees(45))

            VStack(spacing: 20){
                Text("Welcome")
                    .font(.system(size: 40, weight: .bold, design: .rounded))
                    .offset(x: 0, y: -100)

                TextField("Email", text: $email)
                    .foregroundColor(.white)
                    .textFieldStyle(.plain)
                    .placeholder(when: email.isEmpty){
                        Text("")
                            .foregroundColor(.white)
                            .bold()
                            .textFieldStyle(.plain)
                    }
                Rectangle()
                    .frame(width:350, height: 1)
                    .foregroundColor(.white)

                SecureField("Password", text: $password)
                    .foregroundColor(.white)
                    .textFieldStyle(.plain)
                    .placeholder(when: password.isEmpty){
                        Text("")
                            .foregroundColor(.white)
                            .bold()
                            .textFieldStyle(.plain)
                    }
                Rectangle()
                    .frame(width:350, height: 1)
                    .foregroundColor(.white)

                Button{
                    register()
                } label: {
                    Text("Sign up")
                        .bold()
                        .frame(width: 200, height: 40)
                        .background(RoundedRectangle(cornerRadius: 10, style: .continuous)
                            .fill(.linearGradient(colors: [.cyan, .cyan], startPoint: .top, endPoint: .bottomTrailing)))
                        .foregroundColor(.blue)
                }
                    .padding(.top)
                    .offset(y:120)

                Button{
                    login()
                }label: {
                Text("Already have an account? Login")
                        .bold()
                        .foregroundColor(.blue)
                }
                .padding(.top)
                .offset(y:120)

             }
            .frame(width: 350)
            .onAppear{
                Auth.auth().addStateDidChangeListener { auth, user in
                    if user != nil {
                        UserIsLoggedIn.toggle()
                    }
                }
            }
        }
        .ignoresSafeArea()
    }
    func register(){
        Auth.auth().createUser(withEmail: email, password: password) {
            result, error in
            if error != nil {
                print(error!.localizedDescription  )
            }
        }
    }
    func login(){
        Auth.auth().signIn(withEmail: email, password: password) {
            result, error in
            if error != nil {
                print(error!.localizedDescription  )
            }
        }
    }
}

#Preview {
    ContentView()
}

extension View {
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {

        ZStack(alignment: alignment) {
            placeholder().opacity(shouldShow ? 1 : 0)
            self
        }
    }
}


