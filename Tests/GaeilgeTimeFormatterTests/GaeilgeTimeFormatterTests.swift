import XCTest
@testable import GaeilgeTimeFormatter

final class GaeilgeTimeFormatterTests: XCTestCase {

    func createDate(hour: Int, minute: Int) -> Date {
        var components = DateComponents()
        components.hour = hour
        components.minute = minute
        components.year = 2024
        components.month = 1
        components.day = 1
        components.second = 0

        var calendar = Calendar.current
        calendar.timeZone = TimeZone(identifier: "UTC")!
        return calendar.date(from: components)!
    }

    func testOnTheHour() {
        XCTAssertEqual(GaeilgeTimeFormatter.getIrishTimePhrase(date: createDate(hour: 1, minute: 0)), "Tá sé a haon a chlog")
        XCTAssertEqual(GaeilgeTimeFormatter.getIrishTimePhrase(date: createDate(hour: 7, minute: 0)), "Tá sé a seacht a chlog")
        XCTAssertEqual(GaeilgeTimeFormatter.getIrishTimePhrase(date: createDate(hour: 12, minute: 0)), "Tá sé a dó dhéag a chlog")
        XCTAssertEqual(GaeilgeTimeFormatter.getIrishTimePhrase(date: createDate(hour: 0, minute: 0)), "Tá sé a dó dhéag a chlog")
        XCTAssertEqual(GaeilgeTimeFormatter.getIrishTimePhrase(date: createDate(hour: 23, minute: 0)), "Tá sé a haon déag a chlog")
    }

    func testQuarterPast() {
        XCTAssertEqual(GaeilgeTimeFormatter.getIrishTimePhrase(date: createDate(hour: 1, minute: 15)), "Tá sé ceathrú tar éis a haon")
        XCTAssertEqual(GaeilgeTimeFormatter.getIrishTimePhrase(date: createDate(hour: 10, minute: 15)), "Tá sé ceathrú tar éis a deich")
        XCTAssertEqual(GaeilgeTimeFormatter.getIrishTimePhrase(date: createDate(hour: 0, minute: 15)), "Tá sé ceathrú tar éis a dó dhéag")
    }

    func testHalfPast() {
        XCTAssertEqual(GaeilgeTimeFormatter.getIrishTimePhrase(date: createDate(hour: 2, minute: 30)), "Tá sé leathuair tar éis a dó")
        XCTAssertEqual(GaeilgeTimeFormatter.getIrishTimePhrase(date: createDate(hour: 11, minute: 30)), "Tá sé leathuair tar éis a haon déag")
        XCTAssertEqual(GaeilgeTimeFormatter.getIrishTimePhrase(date: createDate(hour: 12, minute: 30)), "Tá sé leathuair tar éis a dó dhéag")
    }

    func testQuarterTo() {
        XCTAssertEqual(GaeilgeTimeFormatter.getIrishTimePhrase(date: createDate(hour: 3, minute: 45)), "Tá sé ceathrú chun a ceathair")
        XCTAssertEqual(GaeilgeTimeFormatter.getIrishTimePhrase(date: createDate(hour: 23, minute: 45)), "Tá sé ceathrú chun a dó dhéag")
        XCTAssertEqual(GaeilgeTimeFormatter.getIrishTimePhrase(date: createDate(hour: 11, minute: 45)), "Tá sé ceathrú chun a dó dhéag")
    }

    func testMinutesPast() {
        XCTAssertEqual(GaeilgeTimeFormatter.getIrishTimePhrase(date: createDate(hour: 1, minute: 1)), "Tá sé aon nóiméad tar éis a haon")
        XCTAssertEqual(GaeilgeTimeFormatter.getIrishTimePhrase(date: createDate(hour: 1, minute: 2)), "Tá sé dhá nóiméad tar éis a haon")
        XCTAssertEqual(GaeilgeTimeFormatter.getIrishTimePhrase(date: createDate(hour: 1, minute: 3)), "Tá sé trí nóiméad tar éis a haon")
        XCTAssertEqual(GaeilgeTimeFormatter.getIrishTimePhrase(date: createDate(hour: 1, minute: 4)), "Tá sé ceithre nóiméad tar éis a haon")
        XCTAssertEqual(GaeilgeTimeFormatter.getIrishTimePhrase(date: createDate(hour: 1, minute: 5)), "Tá sé cúig nóiméad tar éis a haon")
        XCTAssertEqual(GaeilgeTimeFormatter.getIrishTimePhrase(date: createDate(hour: 1, minute: 10)), "Tá sé deich nóiméad tar éis a haon")
        XCTAssertEqual(GaeilgeTimeFormatter.getIrishTimePhrase(date: createDate(hour: 1, minute: 11)), "Tá sé aon déag nóiméad tar éis a haon")
        XCTAssertEqual(GaeilgeTimeFormatter.getIrishTimePhrase(date: createDate(hour: 1, minute: 14)), "Tá sé ceithre déag nóiméad tar éis a haon")
        XCTAssertEqual(GaeilgeTimeFormatter.getIrishTimePhrase(date: createDate(hour: 1, minute: 16)), "Tá sé sé déag nóiméad tar éis a haon")
        XCTAssertEqual(GaeilgeTimeFormatter.getIrishTimePhrase(date: createDate(hour: 1, minute: 19)), "Tá sé naoi déag nóiméad tar éis a haon")
        XCTAssertEqual(GaeilgeTimeFormatter.getIrishTimePhrase(date: createDate(hour: 1, minute: 20)), "Tá sé fiche nóiméad tar éis a haon")
        XCTAssertEqual(GaeilgeTimeFormatter.getIrishTimePhrase(date: createDate(hour: 1, minute: 21)), "Tá sé fiche is aon nóiméad tar éis a haon")
        XCTAssertEqual(GaeilgeTimeFormatter.getIrishTimePhrase(date: createDate(hour: 1, minute: 25)), "Tá sé fiche is cúig nóiméad tar éis a haon")
        XCTAssertEqual(GaeilgeTimeFormatter.getIrishTimePhrase(date: createDate(hour: 1, minute: 29)), "Tá sé fiche is naoi nóiméad tar éis a haon")
    }

    func testMinutesTo() {
        XCTAssertEqual(GaeilgeTimeFormatter.getIrishTimePhrase(date: createDate(hour: 1, minute: 31)), "Tá sé fiche is naoi nóiméad chun a dó")
        XCTAssertEqual(GaeilgeTimeFormatter.getIrishTimePhrase(date: createDate(hour: 1, minute: 35)), "Tá sé fiche is cúig nóiméad chun a dó")
        XCTAssertEqual(GaeilgeTimeFormatter.getIrishTimePhrase(date: createDate(hour: 1, minute: 40)), "Tá sé fiche nóiméad chun a dó")
        XCTAssertEqual(GaeilgeTimeFormatter.getIrishTimePhrase(date: createDate(hour: 1, minute: 50)), "Tá sé deich nóiméad chun a dó")
        XCTAssertEqual(GaeilgeTimeFormatter.getIrishTimePhrase(date: createDate(hour: 1, minute: 59)), "Tá sé aon nóiméad chun a dó")
        XCTAssertEqual(GaeilgeTimeFormatter.getIrishTimePhrase(date: createDate(hour: 23, minute: 55)), "Tá sé cúig nóiméad chun a dó dhéag")
        XCTAssertEqual(GaeilgeTimeFormatter.getIrishTimePhrase(date: createDate(hour: 11, minute: 58)), "Tá sé dhá nóiméad chun a dó dhéag")
    }

    func testEdgeCases() {
        XCTAssertEqual(GaeilgeTimeFormatter.getIrishTimePhrase(date: createDate(hour: 12, minute: 1)), "Tá sé aon nóiméad tar éis a dó dhéag")
        XCTAssertEqual(GaeilgeTimeFormatter.getIrishTimePhrase(date: createDate(hour: 12, minute: 59)), "Tá sé aon nóiméad chun a haon")
        XCTAssertEqual(GaeilgeTimeFormatter.getIrishTimePhrase(date: createDate(hour: 0, minute: 1)), "Tá sé aon nóiméad tar éis a dó dhéag")
        XCTAssertEqual(GaeilgeTimeFormatter.getIrishTimePhrase(date: createDate(hour: 0, minute: 59)), "Tá sé aon nóiméad chun a haon")
    }
}
