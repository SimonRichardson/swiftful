//
//  MaybeSpec.swift
//  Swiftful
//
//  Created by Simon Richardson on 11/02/2015.
//
//

import XCTest
import Swiftful

class MaybeSpec : XCTestCase {
    func testMaybe() {
        let x = Maybe.just(10)
        let y = Maybe.just(1)
        
        XCTAssertTrue(x.GetOrElse(y) == 2)
    }
}