import UIKit

let serialQueue = DispatchQueue(label: "Serial")
let concurrentQueue = DispatchQueue(label: "Concurrent", attributes: .concurrent)

serialQueue.async {
    for i in 1...5 {
        print(i)
    }
}

concurrentQueue.async {
    for i in 6...10 {
        print(i)
    }
}
