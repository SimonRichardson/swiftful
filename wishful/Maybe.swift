//
//  Maybe.swift
//  wishful
//
//  Created by Simon Richardson on 11/02/2015.
//
//

public enum MaybeE<A> {
    
    case Just(A)
    
    case Nothing
}

public struct Maybe<A> {
    let x: MaybeE<A>
    
    public init(_ v : A) {
        x = v
    }
    
    public init() {}
    
    public static func just(x : A) -> Maybe<A> {
        return Maybe(Just(x))
    }
    
    public static func nothing() -> Maybe<A> {
        return Maybe(Nothing)
    }
}

extension Maybe : Point {
    public static func of(x : A) -> Maybe<A> {
        return Maybe.just(x)
    }
}

extension Maybe : Applicative {
    typealias FA = Maybe<A>
    typealias FAB = Maybe<A -> B>
    
    public func ap<B>(f : Maybe<A -> B>) -> Maybe<B> {
        return f.chain({ (g) -> Maybe<B> in
            return self.map(g)
        })
    }
}

extension Maybe : Functor {
    typealias B = Any
    typealias FB = Maybe<B>
    
    public func map<B>(f : (A -> B)) -> Maybe<B> {
        return self.chain({ (x) -> Maybe<B> in
            return Maybe.just(f(x))
        })
    }
}

extension Maybe : Monad {
    typealias B = Any
    typealias FB = Maybe<B>
    
    public func chain<B>(f : (A -> Maybe<B>)) -> Maybe<B> {
        switch self.x {
        case .Just(x):
            return f(x)
        case .Nothing:
            return self
        }
    }    
}