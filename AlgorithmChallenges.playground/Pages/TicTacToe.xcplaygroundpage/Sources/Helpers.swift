
extension Sequence  {
  public func contains<T, U>(_ tuple: (T, U)) -> Bool where T: Equatable, U: Equatable, Element == (T,U) {
    contains { $0 == tuple }
  }
}
