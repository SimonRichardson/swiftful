//
//  combinators.swift
//  wishful
//
//  Created by Simon Richardson on 11/02/2015.
//
//

// Compose

public prefix func • <A, B, C>(g : A -> B) -> (B -> C) -> (A -> C) {
    return {
        f in {
            a in f(g(a))
        }
    }
}

public postfix func • <A, B, C>(f : B -> C) -> (A -> C) -> (B -> C) {
    return {
        g in {
            a in f(g(a))
        }
    }
}
