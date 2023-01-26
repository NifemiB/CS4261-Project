//
//  ContentView.swift
//  FirstIosApp
//
//  Created by Oluwanifemi Bolu on 1/24/23.
//

import SwiftUI
import AVFoundation

struct ContentView: View {
    //variables
    @State private var backgroundcolor: Int = 0
    
    func toggleTorch(on: Bool) {
        guard let device = AVCaptureDevice.default(for: AVMediaType.video) else { return }
        guard device.hasTorch else { print("Torch isn't available"); return }

        do {
            try device.lockForConfiguration()
            device.torchMode = on ? .on : .off
            device.unlockForConfiguration()
        } catch {
            print("Torch can't be used")
        }
    }
    
    var body: some View {
        
        
        
        ZStack {
            if backgroundcolor == 0 {
                Color(.white)
            } else if backgroundcolor == 1 {
                Color(.blue)
            } else if backgroundcolor == 2 {
                Color(.red)
            } else if backgroundcolor == 3 {
                Color(.orange)
            }
            
            
            
            VStack {
                
                Button("See Weather", action: {
                    
                })
                .buttonStyle(.borderedProminent)
                
                
                HStack {
                    Button("Blue", action: {
                        backgroundcolor = 1
                    })
                    .buttonStyle(.borderedProminent)
//                    .background(.white)
//                    .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
//                    .foregroundColor(.blue)
                    .tint(.pink)
                    
                    
                    Button("Red", action: {
                        backgroundcolor = 2
                    })
                    .padding(3.0)
//                    .background(.white)
//                    .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
//                    .foregroundColor(.red)
                    .buttonStyle(.borderedProminent)
                    .tint(.pink)
                    
                    Button("Orange", action: {
                        backgroundcolor = 3
                    })
                    .accessibilityAddTraits([.isButton])
                    .accessibilityLabel("btn4")
//                    .background(.white)
//                    .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
//                    .foregroundColor(.orange)
                    .buttonStyle(.borderedProminent)
                    .tint(.pink)
                    
                }
                Button("Reset", action: {
                    backgroundcolor = 0
                })
                .buttonStyle(.borderedProminent)
                .tint(.white)
                .foregroundColor(.pink)
                
                var tt: Bool = true
                Button("Flashlight", action: {
                    if tt == true {
                        tt = false
                        toggleTorch(on: tt)
                    } else {
                        tt = true
                        toggleTorch(on: tt)
                    }
                    
                })
                .buttonStyle(.borderedProminent)
                .tint(.green)
                
                
                
                
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                Text("Hello, world!")
                    .foregroundColor(.accentColor)
            }
        }
        .padding(.top)
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
