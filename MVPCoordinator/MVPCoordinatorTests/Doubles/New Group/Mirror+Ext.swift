import Foundation

extension Mirror {
    static func extract<T>(named name: String, from object: Any?) -> T? {
        guard let object = object else { return nil }
        
        let mirror = Mirror(reflecting: object)
        
        return mirror.children.first {
            $0.label == name
        }?.value as? T
    }
}
