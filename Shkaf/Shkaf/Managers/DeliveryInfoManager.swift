//
//  DeliveryInfoManagers.swift
//  Shkaf
//
//  Created by Илья on 06.04.2024.
//

import CoreData
import Foundation

import Foundation
import CoreData

class DeliveryInfoCoreDataManager: ObservableObject {
    static let shared = DeliveryInfoCoreDataManager()
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "CoreData") // Замените на имя вашей модели данных CoreData
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    func saveDeliveryInfoToCoreData(clientName: String, clientSurname: String, clientPhone: String, clientEmail: String, clientCity: String, clientAddress: String) {
        context.perform {
            let deliveryInfo = DeliveryInfo(context: self.context)
            deliveryInfo.id = UUID()
            deliveryInfo.clientName = clientName
            deliveryInfo.clientSurname = clientSurname
            deliveryInfo.clientPhone = clientPhone
            deliveryInfo.clientEmail = clientEmail
            deliveryInfo.clientCity = clientCity
            deliveryInfo.clientAddress = clientAddress
            
            do {
                try self.context.save()
            } catch let error {
                print("Error saving to CoreData: \(error.localizedDescription)")
            }
        }
    }
    
    func fetchDeliveryInfo() -> [DeliveryInfo] {
        let fetchRequest: NSFetchRequest<DeliveryInfo> = DeliveryInfo.fetchRequest()
        
        do {
            let deliveryInfos = try context.fetch(fetchRequest)
            return deliveryInfos
        } catch {
            print("Error fetching delivery info: \(error.localizedDescription)")
            return []
        }
    }
    
    func hasDeliveryInfoInCoreData() -> Bool {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "DeliveryInfo")
        
        do {
            let count = try context.count(for: fetchRequest)
            return count > 0
        } catch {
            print("Error checking Core Data: \(error.localizedDescription)")
            return false
        }
    }
    
    func clearCoreData() {
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "DeliveryInfo")
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        
        do {
            try context.execute(deleteRequest)
            try context.save()
        } catch {
            print("Error clearing Core Data: \(error.localizedDescription)")
        }
    }
}
