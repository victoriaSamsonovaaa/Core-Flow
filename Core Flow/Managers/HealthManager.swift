//
//  HealthManager.swift
//  Core Flow
//
//  Created by Victoria Samsonova on 25.01.25.
//

import Foundation
import HealthKit
import WidgetKit

class HealthManager: ObservableObject {
    
    static let shared = HealthManager()
    var healthStore = HKHealthStore()

    func requestAuth() {
        let dataToRead = Set([
            HKObjectType.quantityType(forIdentifier: .stepCount)!,
            HKObjectType.quantityType(forIdentifier: .activeEnergyBurned)!])
                             
        guard HKHealthStore.isHealthDataAvailable() else {
          print("health data not available!")
          return
        }
            
        healthStore.requestAuthorization(toShare: nil, read: dataToRead) { success, failure in
            if success {
                self.fetchAllData()
            } else {
                print("didn't get auth in health")
            }
        }
    }
    
    func fetchAllData() {

    }

    private init() {
        let calories = HKQuantityType(.activeEnergyBurned)
        let exerciseTime = HKQuantityType(.appleExerciseTime)
        let stand = HKCategoryType(.appleStandHour)
        
        let healthTypes: Set = [calories, exerciseTime, stand]
    }
    
    
    
}
