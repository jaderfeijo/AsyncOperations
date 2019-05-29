//
// Copyright © 2019 Jader Feijo. All rights reserved.
//

import Foundation

public protocol ObservableKey: Hashable {
    associatedtype Value
}

public protocol Observer: class {
    associatedtype Key: ObservableKey
    func valueDidChange(for key: Key, from old: Key.Value, to new: Key.Value)
}

public protocol Observable {
    func addObserver<K: ObservableKey, O: Observer>(forKey key: K, observer: O)
    func removeObserver<K: ObservableKey>(forKey key: K)
}
