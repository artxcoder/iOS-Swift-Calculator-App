//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by Rahul K on 08/11/23.
//

import XCTest
@testable import Calculator

final class CalculatorTests: XCTestCase {

    var input1: Int!
    var input2: Int!
    var calc: CalculatorVC!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        input1 = 5
        input2 = 5
        calc = CalculatorVC()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testOperateOnTwoNumbers() throws {
        let resultAdd = calc.calculate(num1: input1, num2: input2, op: "+")
        XCTAssertEqual(resultAdd, 10)
        
        let resultSub = calc.calculate(num1: input1, num2: input2, op: "-")
        XCTAssertEqual(resultSub, 0)
        
        let resultDiv = calc.calculate(num1: input1, num2: input2, op: "/")
        XCTAssertEqual(resultDiv, 1)
        
        let resultMulti = calc.calculate(num1: input1, num2: input2, op: "x")
        XCTAssertEqual(resultMulti, 25)
        
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
