import Foundation

public struct GaeilgeTimeFormatter {
    public static func getIrishTimePhrase(date: Date = Date()) -> String {
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: date)
        let minute = calendar.component(.minute, from: date)
        let nextHour = (hour + 1) % 24

        func getFormattedHour(_ h: Int) -> String {
            let displayHour = h % 12 == 0 ? 12 : h % 12
            let hoursMap: [Int: String] = [
                12: "a dó dhéag",
                1: "a haon",
                2: "a dó",
                3: "a trí",
                4: "a ceathair",
                5: "a cúig",
                6: "a sé",
                7: "a seacht",
                8: "a hocht",
                9: "a naoi",
                10: "a deich",
                11: "a haon déag"
            ]
            return hoursMap[displayHour] ?? ""
        }

        func getFormattedNextHour(_ h: Int) -> String {
            let displayHour = h % 12 == 0 ? 12 : h % 12
            let hoursMap: [Int: String] = [
                12: "a dó dhéag",
                1: "a haon",
                2: "a dó",
                3: "a trí",
                4: "a ceathair",
                5: "a cúig",
                6: "a sé",
                7: "a seacht",
                8: "a hocht",
                9: "a naoi",
                10: "a deich",
                11: "a haon déag"
            ]
            return hoursMap[displayHour] ?? ""
        }

        func getFormattedMinutePhrase(_ m: Int) -> String {
            var phrase: String

            if m == 1 {
                phrase = "nóiméad amháin"
            } else if m == 2 {
                phrase = "dhá nóiméad"
            } else if m == 3 {
                phrase = "trí nóiméad"
            } else if m == 4 {
                phrase = "ceithre nóiméad"
            } else if m >= 5 && m <= 10 {
                let numbersMap: [Int: String] = [
                    5: "cúig",
                    6: "sé",
                    7: "seacht",
                    8: "ocht",
                    9: "naoi",
                    10: "deich",
                ]
                phrase = "\(numbersMap[m]!) nóiméad"
            } else if m >= 11 && m <= 14 {
                let numbersMap: [Int: String] = [
                    11: "aon",
                    12: "dhá",
                    13: "trí",
                    14: "ceithre",
                ]
                phrase = "\(numbersMap[m]!) nóiméad déag"
            } else if m >= 16 && m <= 19 {
                let numbersMap: [Int: String] = [
                    16: "sé",
                    17: "seacht",
                    18: "ocht",
                    19: "naoi",
                ]
                phrase = "\(numbersMap[m]!) nóiméad déag"
            } else if m == 20 {
                phrase = "fiche nóiméad"
            } else if m >= 21 && m <= 29 {
                let unit = m % 10
                var unitPhrase: String

                if unit == 1 { unitPhrase = "haon" }
                else if unit == 2 { unitPhrase = "dó" }
                else if unit == 3 { unitPhrase = "trí" }
                else if unit == 4 { unitPhrase = "ceathair" }
                else if unit == 5 { unitPhrase = "cúig" }
                else if unit == 6 { unitPhrase = "sé" }
                else if unit == 7 { unitPhrase = "seacht" }
                else if unit == 8 { unitPhrase = "hocht" }
                else { unitPhrase = "naoi" }

                phrase = "fiche a \(unitPhrase) nóiméad"
            } else {
                phrase = ""
            }
            return phrase
        }

        if minute == 0 {
            return "Tá sé \(getFormattedHour(hour)) a chlog"
        } else if minute == 15 {
            return "Tá sé ceathrú tar éis \(getFormattedHour(hour))"
        } else if minute == 30 {
            return "Tá sé leathuair tar éis \(getFormattedHour(hour))"
        } else if minute == 45 {
            return "Tá sé ceathrú chun \(getFormattedNextHour(nextHour))"
        } else if minute < 30 {
            return "Tá sé \(getFormattedMinutePhrase(minute)) tar éis \(getFormattedHour(hour))"
        } else {
            let toMinute = 60 - minute
            return "Tá sé \(getFormattedMinutePhrase(toMinute)) chun \(getFormattedNextHour(nextHour))"
        }
    }
}