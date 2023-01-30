//
//  FirstIosAppApp.swift
//  FirstIosApp
//
//  Created by Oluwanifemi Bolu on 1/24/23.
//

import SwiftUI
import Firebase

@main
struct FirstIosAppApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            LogInView()
        }
    }
}
