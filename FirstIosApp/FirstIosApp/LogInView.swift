//
//  LogInView.swift
//  FirstIosApp
//
//  Created by Oluwanifemi Bolu on 1/27/23.
//

import SwiftUI
import Firebase

struct LogInView: View {
    
    @State private var email = ""
    @State private var password = ""
    @State private var userIsLoggedIn = false
    
    
    var body: some View {
        if userIsLoggedIn {
            //go somewhere
            ContentView()
        } else {
            content
        }
    }
    
    var content: some View{
        VStack(spacing:20){
            Text("Welcome")
                .foregroundColor(.black)
                .font(.system(size: 40))
                .offset(x:-100, y:-100)
            TextField("Email", text: $email)
                .textFieldStyle(.plain)
                .placeholder(when: email.isEmpty) {
                    Text("Email")
                        .bold()
                }
            Rectangle()
                .frame(width: 350, height: 1)
            
            SecureField("Password", text: $password)
                .textFieldStyle(.plain)
                .placeholder(when: password.isEmpty) {
                    Text("Password")
                    .bold()
                }
            
            Rectangle()
                .frame(width: 350, height: 1)
            
            Button {
                //sign up
                register()
            } label: {
                Text("Sign up")
                    .bold()
                    .frame(width: 200, height: 40)
                    
                    
            }
            .buttonStyle(.borderedProminent)
            
            Button {
                //login
                login()
            } label: {
                Text("Already have an account? Login")
                    .bold()
            }


            
            
        }
        .frame(width: 350)
        .onAppear() {
//            Auth.auth().addStateDidChangeListener{ auth, user in
//                if user != nil {
//                    userIsLoggedIn = true
//                }
//            }
        }
    }
    
    func signOut() {
        userIsLoggedIn = false
    }
    
    func login() {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if error != nil {
                print(error!.localizedDescription)
            } else {
                Auth.auth().addStateDidChangeListener{ auth, user in
                    if user != nil {
                        userIsLoggedIn = true
                    }
                }
            }
            
            
        }
    }
    
    
    
    func register() {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if error != nil {
                print(error!.localizedDescription)
            } else {
                Auth.auth().addStateDidChangeListener{ auth, user in
                    if user != nil {
                        userIsLoggedIn = true
                    }
                }
            }
        }
    }
}

struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        LogInView()
    }
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
