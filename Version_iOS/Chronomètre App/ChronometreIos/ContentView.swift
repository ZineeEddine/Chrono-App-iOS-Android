//
//  ContentView.swift
//  ChronometreIos
//
//  Created by Hadj Rabah on 18/11/2022.
//

import SwiftUI



struct ContentView: View {
    
    @ObservedObject var chronoManager = ChronoManager()
    
    var body: some View {
        VStack {
            Text("Chronomètre App iOS").bold()
            
            Text(String(format: "%d:%d:%.1f", chronoManager.hoursElapsed,chronoManager.minutesElapsed,chronoManager.secondsElapsed))
                .font(.custom("Avenir", size: 40))
                .padding(.top, 200)
                .padding(.bottom, 100)
            
            Button(action: {
                self.chronoManager.start()

                print("Lance Le chrono")
            }) {
                Text("Start").foregroundColor(.white)
                    .padding(.vertical, 20)
                    .padding(.horizontal, 90)
                    .background(Color.pink)
                    .cornerRadius(10)
            }
            
            Button(action: {
                self.chronoManager.pause()
                print("Stop Le chrono")
            }) {
                Text("Stop").foregroundColor(.white)
                    .padding(.vertical, 20)
                    .padding(.horizontal, 90)
                    .background(Color.pink)
                    .cornerRadius(10)
            }
            
            Button(action: {
                self.chronoManager.reset()
                print("Reset Le chrono")
            }) {
                Text("Reset").foregroundColor(.white)
                    .padding(.vertical, 20)
                    .padding(.horizontal, 90)
                    .background(Color.pink)
                    .cornerRadius(10)
            }
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

