import SwiftUI
import CoreMotion

// @MainActor

class LogLoop {
    static func count(_ model: TracesViewModel) async throws {
        try await motion(model)
        return
        while true {
            try await Task.sleep(nanoseconds: 1_000_000_000)
            print("après sleep")
            model.append("modelappend", level: LogLevel.ALL)
        }
    }

    static func motion(_ model: TracesViewModel) async throws {
        let manager = CMMotionManager()
        manager.startGyroUpdates()
        manager.startAccelerometerUpdates()
        while true {
            try await Task.sleep(nanoseconds: 1_000_000_000)
            model.append("gyro: \(String(format: "%.2f", manager.gyroData!.rotationRate.x)), \(String(format: "%.2f", manager.gyroData!.rotationRate.y)), \(String(format: "%.2f", manager.gyroData!.rotationRate.z)) - accel: \(String(format: "%.2f", manager.accelerometerData!.acceleration.x)), \(String(format: "%.2f", manager.accelerometerData!.acceleration.y)), \(String(format: "%.2f", manager.accelerometerData!.acceleration.z))", level: LogLevel.ALL)
        }
    }
}
