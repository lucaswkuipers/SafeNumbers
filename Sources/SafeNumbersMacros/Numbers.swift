extension Double: Number {}
extension Int: Number {}

protocol Number: Comparable {
    static var zero: Self { get }
}

extension Number {
    var isPositive: Bool {
        self > .zero
    }

    var isNegative: Bool {
        self < .zero
    }

    var isZero: Bool {
        self == .zero
    }
}

