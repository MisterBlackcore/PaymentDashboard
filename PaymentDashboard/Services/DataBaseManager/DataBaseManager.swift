import UIKit
import RealmSwift

final class DataBaseManager {
    //MARK: - Properties
    let realm = try? Realm()
    
    //MARK: - Functions
    func saveObjectsToRealm(_ object: [Object]) {
        try? realm?.write {
            realm?.add(object)
        }
    }
    
    func loadObjects<T: Object>(with type: T.Type) throws -> [T] {
        let realm = try Realm()
        let objects = Array(realm.objects(T.self))
        return objects
    }
}
