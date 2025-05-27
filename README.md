# GaeilgeTimeFormatter

A Swift Package for converting `Date` objects into natural, idiomatic Irish (Gaeilge) time phrases.

## Installation

### Swift Package Manager (Recommended)

You can add `GaeilgeTimeFormatter` to your Xcode project by going to `File > Add Packages...` and entering the repository URL:

> `https://github.com/peterelst/GaeilgeTimeFormatter.git`

## Usage

Import `GaeilgeTimeFormatter` into your Swift file:

```
import GaeilgeTimeFormatter
import Foundation

// Get current time in Irish
let currentTimeInIrish = GaeilgeTimeFormatter.getIrishTimePhrase()`
print(currentTimeInIrish)

// Get specific time in Irish
var components = DateComponents()
components.year = 2024
components.month = 3
components.day = 15
components.hour = 14 // 2 PM
components.minute = 45

var calendar = Calendar.current
calendar.timeZone = TimeZone(identifier: "UTC")!
let specificDate = calendar.date(from: components)!

let specificTimeInIrish = GaeilgeTimeFormatter.getIrishTimePhrase(date: specificDate)
print(specificTimeInIrish)

// Output: "Tá sé ceathrú chun a trí" (It is quarter to three)

// Example for 1:05 AM
var components1_05 = DateComponents()
components1_05.year = 2024
components1_05.month = 3
components1_05.day = 15
components1_05.hour = 1 // 1 AM
components1_05.minute = 5
let date1_05 = calendar.date(from: components1_05)!
print("01:05 -> " + GaeilgeTimeFormatter.getIrishTimePhrase(date: date1_05))

// Output: "01:05 -> Tá sé cúig nóiméad tar éis a haon"
```

## Time Format Patterns

The package follows traditional Irish time-telling patterns:

* **On the hour:** `Tá sé a [hour] a chlog`
    * Example: "Tá sé a haon a chlog" (It's one o'clock)
* **Past the hour (1-29 minutes):** `Tá sé [minutes] tar éis a [hour]`
    * Example: "Tá sé cúig nóiméad tar éis a dó" (It's five past two)
* **Half past:** `Tá sé leathuair tar éis a [hour]`
    * Example: "Tá sé leathuair tar éis a trí" (It's half past three)
* **To the hour (31-59 minutes):** `Tá sé [minutes] chun a [next hour]`
    * Example: "Tá sé deich nóiméad chun a ceathair" (It's ten to four)
* **Quarter past:** `Tá sé ceathrú tar éis a [hour]`
    * Example: "Tá sé ceathrú tar éis a dó dhéag" (It's quarter past twelve)
* **Quarter to:** `Tá sé ceathrú chun a [next hour]`
    * Example: "Tá sé ceathrú chun a trí" (It's quarter to three)

## Features

* Converts standard `Date` objects to idiomatic Irish time phrases.
* Handles minutes (1-29 'tar éis' and 1-29 'chun') and special cases like quarter past/to and half past.
* Uses traditional Irish number forms for hours and minutes where applicable.
* Returns grammatically correct Irish phrases.
* Zero external dependencies (relies only on `Foundation`).

## Contributing

Contributions are very welcome! If you have suggestions for improvements, find a bug, or want to add more features please get in touch.

## License

This project is licensed under the MIT License - see the `LICENSE` file for details.

## Support

If you found this package helpful, you can:

-   [Buy me a coffee](https://www.buymeacoffee.com/peterelst)
-   Star the project on GitHub
-   Report any issues you find
