//
//  SafetyTopicEnum.swift
//  DailyReport V1
//
//  Created by Satoshi Mitsumori on 5/8/24.
//

import Foundation
import SwiftUI

enum SafetyTopicEnum: String, CaseIterable {
    case NA
    case minimumPPE
    case hotwork
    case refuelingEquipment
    case maintainingSwingRadius
    case equipmentMaterialDelivery
    case loadingUnloadingEquipment
    case movingMobileHeavyEquipment
    case communicationwithEquipment
    case workingwithyourHands
    case visitingJobsite
    case airMonitoring
    case confinedSpaceEntry
    case workingWithPortablePower
    case handdrillElectricDrillHammer
    case angleGrinder
    case bargeWork
    case boomScissorLift
    case coldWeather
    case compressor
    case craneassembly
    case errectingSilo
    case forkLiftOperation
    case hotweatherEnvironments
    case hydraulicJackOperation
    case jackHammering
    case ladders
    case rebarhanding
    case telehanderOperation
    case workinginExcavation
    case workingnearPowerLines
    
    var safetyArray: String {
        switch self {
        case .NA:
            return "N/A"
        case .minimumPPE:
            return "Minimum"
        case .hotwork:
            return "HotWork (Welding, Air Arc, Hardfacing, Torching, Cutting)"
        case .refuelingEquipment:
            return "Refueling Equipment"
        case .maintainingSwingRadius:
            return "Maintaining Swing Radius"
        case .equipmentMaterialDelivery:
            return "Equipment Material Delivery"
        case .loadingUnloadingEquipment:
            return "Loading & Unloading Equipment"
        case .movingMobileHeavyEquipment:
            return "Moving Mobile Heavy Equipment"
        case .communicationwithEquipment:
            return "Communication with Equipment Operator"
        case .workingwithyourHands:
            return "Working with your hands"
        case .visitingJobsite:
            return "Visiting Jobsite"
        case .airMonitoring:
            return " Air Monitoring"
        case .confinedSpaceEntry:
            return "Confined Space Entry"
        case .workingWithPortablePower:
            return "Working with Portable Power"
        case .handdrillElectricDrillHammer:
            return "Handle Drill Electric Drill Hammer"
        case .angleGrinder:
            return "Angle Grinder"
        case .bargeWork:
            return "Working on the Barge"
        case .boomScissorLift:
            return "Boom Scissor Forklift safety"
        case .coldWeather:
            return "Increment Cold Weather"
        case .compressor:
            return "Air Compressor safety"
        case .craneassembly:
            return "Crane Assembly"
        case .errectingSilo:
            return "Errecting Silo"
        case .forkLiftOperation:
            return "Fork Lift Operation safety"
        case .hotweatherEnvironments:
            return "Hot Weather Environments"
        case .hydraulicJackOperation:
            return "Hydraulic Jack Operation"
        case .jackHammering:
            return "Jack Hammering safety"
        case .ladders:
            return "Ladder Safety "
        case .rebarhanding:
            return "Rebar Handling safety"
        case .telehanderOperation:
            return "telehander operation"
        case .workinginExcavation:
            return "Working around or in Excavation"
        case .workingnearPowerLines:
            return "Working near Power Lines"
        }
    }
    
}
