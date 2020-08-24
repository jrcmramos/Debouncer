//

import Foundation

public class Debouncer {

    // MARK: - Properties
    private let interval: TimeInterval
    private let queue: DispatchQueue
    private var workItem: DispatchWorkItem?

    // MARK: - Initializer
    public init(seconds: TimeInterval, queue: DispatchQueue = DispatchQueue.global(qos: .unspecified)) {
        self.interval = seconds
        self.queue = queue
    }

    // MARK: - Debouncing function
    public func debounce(action: @escaping (() -> Void)) {
        self.cancel()
        let workItem = DispatchWorkItem(block: {
            DispatchQueue.main.async {
                action()
            }
            self.workItem = nil
        })
        self.queue.asyncAfter(deadline: .now() + interval, execute: workItem)

        self.workItem = workItem
    }

    public func cancel() {
        self.workItem?.cancel()
        self.workItem = nil
    }
}
