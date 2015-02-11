//
//  Applicative.swift
//  wishful
//
//  Created by Simon Richardson on 11/02/2015.
//
//

public protocol Applicative : Pointed, Functor {
    
    typealias FAB = Kind1<A -> B>
    
    func ap(f : FAB) -> FB
}
