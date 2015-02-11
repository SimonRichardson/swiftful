//
//  Functor.swift
//  wishful
//
//  Created by Simon Richardson on 11/02/2015.
//
//

public protocol Functor {
    
    typealias A
    
    typealias B
    
    typealias FB = Kind2<A, B>
    
    func map(f : A -> B) -> FB
}
