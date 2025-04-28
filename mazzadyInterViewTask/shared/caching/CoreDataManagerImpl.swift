//
//  CoreDataManagerImpl.swift
//  mazzadyInterViewTask
//
//  Created by yearex on 28/04/2025.
//

import Foundation
import CoreData

import CoreData

class CoreDataManager: CoreDataManagerProtocol {
    private let persistentContainer: NSPersistentContainer

    init(persistentContainer: NSPersistentContainer) {
        self.persistentContainer = persistentContainer
    }

    func save<T: NSManagedObject>(_ entity: T.Type, configure: (T) -> Void) {
        let context = persistentContainer.viewContext
        let entityObject = T(context: context)
        configure(entityObject)

        do {
            try context.save()
        } catch {
            print("Failed to save entity: \(error)")
        }
    }

    func fetch<T: NSManagedObject>(_ entity: T.Type) -> [T]? {
        let context = persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<T>(entityName: String(describing: T.self))

        do {
            let entities = try context.fetch(fetchRequest)
            return entities
        } catch {
            print("Failed to fetch entities: \(error)")
            return nil
        }
    }
}
