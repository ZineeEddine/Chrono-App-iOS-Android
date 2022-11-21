//
//  Chrono.swift
//  ChronometreIos
//
//  Created by Hadj Rabah on 21/11/2022.
//

import SwiftUI
//  on aurait très bien pu  tout faire dans un seul fichier ContentView.swift

// enum des différents état possible du chronomètre
// en marche, en pause , et reset
enum ChronoMode {
    case running
    case paused
    case reset
}

class ChronoManager: ObservableObject {
    
    @Published var mode: ChronoMode = .reset
    @Published var secondsElapsed = 0.0 // secondes écoulées
    @Published var minutesElapsed = 00 // minutes écoulées
    @Published var hoursElapsed = 00 // heures écoulées
    
    var timer = Timer()
    
    func start() {
        mode = .running
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
            self.secondsElapsed = self.secondsElapsed + 0.1
        
            if(self.secondsElapsed >= 60.0){ // si le nombre de secondes écoulées égale 60
                //alors on ajoute 1 aux minutes écoulées et on rénitialise les secondes à 0
            self.minutesElapsed = self.minutesElapsed + 01
            self.secondsElapsed = 0
            
        }
            if(self.minutesElapsed > 60){ // si le nombre de minutes écoulées égale 60
                //alors on ajoute 1 aus heures écoulées et on rénitialise les minutes à 0
            self.hoursElapsed = self.hoursElapsed + 01
            self.minutesElapsed = 0
            
        }
        }
    }
    
    func pause() {
        timer.invalidate()
        mode = .paused
    }
    
    func reset() {
        //si  reset alors toutess les variables du temps seront remis à 0
        timer.invalidate()
        secondsElapsed = 0 // secondes remis à 0
        minutesElapsed = 0 // minutes remis à 0
        hoursElapsed = 0 // heures remis à 0
        mode = .reset
    }
    
}
