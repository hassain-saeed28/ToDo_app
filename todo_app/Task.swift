//
//  Task.swift
//  todo_app
//
//  Created by Ahmed Almohammed on 18/04/2022.
//

import Foundation
import RealmSwift

class Task: Object, ObjectKeyIdentifiable{
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var title = ""
    @Persisted var completed = false
}
