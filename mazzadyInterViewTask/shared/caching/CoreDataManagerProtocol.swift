//
//  CoreDataManagerProtocol.swift
//  mazzadyInterViewTask
//
//  Created by yearex on 28/04/2025.
//

import Foundation
import CoreData

protocol CoreDataManagerProtocol {
    func save<T: NSManagedObject>(_ entity: T.Type, configure: (T) -> Void)
    func fetch<T: NSManagedObject>(_ entity: T.Type) -> [T]?
}
