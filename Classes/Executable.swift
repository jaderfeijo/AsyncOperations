//
// Copyright © 2019 Jader Feijo. All rights reserved.
//

import Foundation

// MARK: - Executable -

public enum ExecutableStatus<Result> {
    case unready
    case ready
    case executing
    case finished(Result)
}

public enum ExecutableStatusKey<Result>: ObservableKey {
    public typealias Value = ExecutableStatus<Result>
    case status
}

public protocol Executable: Observable {
    associatedtype Result
    
    var status: ExecutableStatus<Result> { get }
    func start()
}
