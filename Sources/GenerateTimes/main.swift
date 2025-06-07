import Foundation
import GaeilgeTimeFormatter // Assuming your GaeilgeTimeFormatter struct is in a module named GaeilgeTimeFormatter

// Main execution logic to generate CSV
func generateCsvOutput() {
    print("time_hh_mm,gaeilge_phrase") // CSV header

    let calendar = Calendar.current
    var components = DateComponents()
    components.year = 2024
    components.month = 1
    components.day = 1
    components.second = 0
    let timeZone = TimeZone(identifier: "UTC")!

    for hour in 0..<12 {
        for minute in 0..<60 {
            components.hour = hour
            components.minute = minute

            if let date = calendar.date(from: components) {
                // Call the GaeilgeTimeFormatter from the imported module
                let gaeilgePhrase = GaeilgeTimeFormatter.getIrishTimePhrase(date: date)
                let formattedTime = String(format: "%02d_%02d", hour, minute)
                print("\(formattedTime),\"\(gaeilgePhrase)\"")
            }
        }
    }
}

// Call the generation function directly at the top level
// This approach is suitable for standalone Swift scripts when the necessary modules are built.
generateCsvOutput()