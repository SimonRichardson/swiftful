//
//  Monad.swift
//  wishful
//
//  Created by Simon Richardson on 11/02/2015.
//
//

public protocol Monad : Applicative {
    func chain(f : A -> FB) -> FB
}
