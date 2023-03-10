//
//  Task.swift
//  ToDoWithRealm
//
//  Created by 김담인 on 2023/02/16.
//

import Foundation
import RealmSwift

class Task: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var title = ""
    @Persisted var completed = false
}
