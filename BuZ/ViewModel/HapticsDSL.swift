//
//  HapticsDSL.swift
//
//  Created by Victor Martins on 10/10/22.
//  Version 1.0
//

import Foundation
import CoreHaptics

open class HapticEvent {
    
    public var eventType: CHHapticEvent.EventType?
    public var duration: TimeInterval
    public var specificTime: TimeInterval?
    
    init(eventType: CHHapticEvent.EventType?, duration: TimeInterval, specificTime: TimeInterval?) {
        self.eventType = eventType
        self.duration = duration
        self.specificTime = specificTime
    }
    
}

public final class TransientEvent: HapticEvent {
    
    public init(startingExactlyAt eventTime: TimeInterval? = nil) {
        super.init(eventType: .hapticTransient,
                   duration: 0.1,
                   specificTime: eventTime)
    }
    
}

public final class ContinuousEvent: HapticEvent {
    
    public init(duration: TimeInterval, startingExactlyAt eventTime: TimeInterval? = nil) {
        super.init(eventType: .hapticContinuous,
                   duration: duration,
                   specificTime: eventTime)
    }
    
}

public final class HapticDelay: HapticEvent {
    
    public init(duration: TimeInterval) {
        super.init(eventType: nil,
                   duration: duration,
                   specificTime: nil)
    }
    
}

public final class HapticPattern {
    let delayBetweenEvents: TimeInterval
    let start: TimeInterval
    let hapticEvents: [HapticEvent]
    
    public init(delayBetweenEvents: TimeInterval = 0.1,
                startingAt start: TimeInterval = 0,
                @HapticBuilder _ builder: () -> [HapticEvent]) {
        self.delayBetweenEvents = delayBetweenEvents
        self.start = start
        self.hapticEvents = builder()
    }
}

extension CHHapticPattern {
    public convenience init(delayBetweenPatterns: TimeInterval = 0.1,
                            startingAt start: TimeInterval = 0,
                            fromPatternSequence patterns: [HapticPattern]) throws {
        // Array que armazena os eventos de haptics processados
        var finalHapticEvents = [CHHapticEvent]()
        
        // Marcador de tempo atual
        var currentTime: TimeInterval = start
        
        // Para cada HapticEvent
        for pattern in patterns {
            // Esperar o delay inicial dessa pattern
            currentTime += pattern.start
            // Marcador do início da pattern atual
            let patternStart: TimeInterval = start
            // Preparar o cálculo do final do último evento
            var lastEventEnd: TimeInterval = 0
            
            for hapticEvent in pattern.hapticEvents {
                // Se for um evento, e não um delay
                if let eventType = hapticEvent.eventType {
                    // Calcular o tempo relativo
                    let relativeTime: TimeInterval
                    if let specificTime = hapticEvent.specificTime {
                        relativeTime = specificTime + patternStart
                    } else {
                        relativeTime = currentTime
                    }
                    // Criar o CHHapticEvent
                    let realHapticEvent = CHHapticEvent(eventType: eventType,
                                                        parameters: [],
                                                        relativeTime: relativeTime,
                                                        duration: hapticEvent.duration)
                    // Atualizar o final do último evento
                    lastEventEnd = max(lastEventEnd, relativeTime + hapticEvent.duration)
                    // Adicionar o CHHapticEvent na lista de eventos
                    finalHapticEvents.append(realHapticEvent)
                }
                
                // Se o evento não for posicionado em um tempo específico,
                // significa que ele precisa avançar o marcador auxiliar
                if hapticEvent.specificTime == nil {
                    // Avançar o marcador de tempo auxiliar
                    currentTime += hapticEvent.duration + pattern.delayBetweenEvents
                }
            }
            currentTime = lastEventEnd + delayBetweenPatterns
        }
        
        try self.init(events: finalHapticEvents, parameters: [])
    }
}

@resultBuilder
public enum HapticBuilder {
    public static func buildBlock(_ components: HapticEvent...) -> [HapticEvent] {
        components
    }
}
