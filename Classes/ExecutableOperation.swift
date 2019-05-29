//
// Copyright © 2019 Jader Feijo. All rights reserved.
//

import Foundation

public class ExecutableOperation<E: Executable>: Operation {
    
    let executable: E
    
    init(executable: E) {
        self.executable = executable
        super.init()
    }
    
    public override var isAsynchronous: Bool {
        return true
    }
    
    public override var isReady: Bool {
        return executable.status.isReady
    }
    
    public override var isExecuting: Bool {
        return executable.status.isExecuting
    }
    
    public override var isFinished: Bool {
        return executable.status.isFinished
    }
    
    public override func start() {
        executable.start()
    }
}

fileprivate
extension ExecutableStatus {
    var isReady: Bool {
        switch self {
        case .ready, .executing, .finished:
            return true
        case .unready:
            return false
        }
    }
    
    var isExecuting: Bool {
        switch self {
        case .executing:
            return true
        default:
            return false
        }
    }
    
    var isFinished: Bool {
        switch self {
        case .finished:
            return true
        default:
            return false
        }
    }
}
