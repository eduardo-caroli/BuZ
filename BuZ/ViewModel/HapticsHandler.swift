//
//  HapticsHandler.swift
//

import Foundation
import CoreHaptics

class HapticsHandler: ObservableObject {
    var engine: CHHapticEngine?
    var isEngineRunning = false
    
    init() {
        self.startHapticEngine()
    }
    
    private func startHapticEngine() {
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }
        guard self.isEngineRunning == false else { return }
        
        do {
            engine = try CHHapticEngine()
            try engine?.start()
            self.isEngineRunning = true
        } catch {
            print("There was an error creating the engine: \(error.localizedDescription)")
            self.isEngineRunning = false
        }
        
        engine?.stoppedHandler = { reason in
            print("The engine has stopped: \(reason)")
            self.isEngineRunning = false
        }
        
        
        engine?.resetHandler = { [weak self] in
            print("The engine was reset")
            
            do {
                try self?.engine?.start()
                self?.isEngineRunning = true
            } catch {
                print("Failed to restart the engine: \(error)")
                self?.isEngineRunning = false
            }
        }
    }
    
    
    let digitos = [
        
        // Padrão do dígito 1
        1: HapticPattern(delayBetweenEvents: 0.1) {
            TransientEvent()
            TransientEvent()
            TransientEvent(startingExactlyAt: 5)
            ContinuousEvent(duration: 0.5)
            ContinuousEvent(duration: 0.5)
            ContinuousEvent(duration: 0.5)
            TransientEvent()
            HapticDelay(duration: 1)
            TransientEvent()
            TransientEvent()
        },
        
        // Padrão do dígito 2
        2: HapticPattern(delayBetweenEvents: 0.1) {
            ContinuousEvent(duration: 1, startingExactlyAt: 0)
        }
        
        
    ]
    
    
    func tocar() {
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else {
            return
        }
        startHapticEngine()
        
        do {
            // Tocando "212" como exemplo
            let sequence = [digitos[2]!, digitos[1]!, digitos[2]!]
            
            let pattern = try CHHapticPattern(delayBetweenPatterns: 0.5,
                                              fromPatternSequence: sequence)
            let player = try engine?.makePlayer(with: pattern)
            try player?.start(atTime: 0)
        } catch {
            print("Failed to play pattern: \(error.localizedDescription).")
        }
    }
}
