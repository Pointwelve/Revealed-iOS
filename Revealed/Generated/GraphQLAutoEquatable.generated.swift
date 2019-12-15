// Generated using Sourcery 0.17.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

// swiftlint:disable file_length
fileprivate func compareOptionals<T>(lhs: T?, rhs: T?, compare: (_ lhs: T, _ rhs: T) -> Bool) -> Bool {
    switch (lhs, rhs) {
    case let (lValue?, rValue?):
        return compare(lValue, rValue)
    case (nil, nil):
        return true
    default:
        return false
    }
}

fileprivate func compareArrays<T>(lhs: [T], rhs: [T], compare: (_ lhs: T, _ rhs: T) -> Bool) -> Bool {
    guard lhs.count == rhs.count else { return false }
    for (idx, lhsItem) in lhs.enumerated() {
        guard compare(lhsItem, rhs[idx]) else { return false }
    }

    return true
}


// MARK: - AutoEquatable for classes, protocols, structs
// MARK: - GetAllPostQuery.Data AutoEquatable
extension GetAllPostQuery.Data: Equatable {}
public func == (lhs: GetAllPostQuery.Data, rhs: GetAllPostQuery.Data) -> Bool {
    guard compareOptionals(lhs: lhs.getAllPosts, rhs: rhs.getAllPosts, compare: ==) else { return false }
    return true
}
// MARK: - GetAllPostQuery.Data.GetAllPost AutoEquatable
extension GetAllPostQuery.Data.GetAllPost: Equatable {}
public func == (lhs: GetAllPostQuery.Data.GetAllPost, rhs: GetAllPostQuery.Data.GetAllPost) -> Bool {
    guard lhs.__typename == rhs.__typename else { return false }
    guard compareOptionals(lhs: lhs.edges, rhs: rhs.edges, compare: ==) else { return false }
    guard compareOptionals(lhs: lhs.pageInfo, rhs: rhs.pageInfo, compare: ==) else { return false }
    return true
}
// MARK: - GetAllPostQuery.Data.GetAllPost.Edge AutoEquatable
extension GetAllPostQuery.Data.GetAllPost.Edge: Equatable {}
public func == (lhs: GetAllPostQuery.Data.GetAllPost.Edge, rhs: GetAllPostQuery.Data.GetAllPost.Edge) -> Bool {
    guard lhs.__typename == rhs.__typename else { return false }
    guard lhs.author == rhs.author else { return false }
    guard compareOptionals(lhs: lhs.tags, rhs: rhs.tags, compare: ==) else { return false }
    guard lhs.topic == rhs.topic else { return false }
    guard lhs.id == rhs.id else { return false }
    guard lhs.excerpt == rhs.excerpt else { return false }
    guard lhs.subject == rhs.subject else { return false }
    guard lhs.createdAt == rhs.createdAt else { return false }
    guard lhs.totalLikesCount == rhs.totalLikesCount else { return false }
    guard lhs.totalCommentsCount == rhs.totalCommentsCount else { return false }
    guard lhs.postViewCount == rhs.postViewCount else { return false }
    guard lhs.status == rhs.status else { return false }
    return true
}
// MARK: - GetAllPostQuery.Data.GetAllPost.Edge.Author AutoEquatable
extension GetAllPostQuery.Data.GetAllPost.Edge.Author: Equatable {}
public func == (lhs: GetAllPostQuery.Data.GetAllPost.Edge.Author, rhs: GetAllPostQuery.Data.GetAllPost.Edge.Author) -> Bool {
    guard lhs.__typename == rhs.__typename else { return false }
    guard lhs.id == rhs.id else { return false }
    guard lhs.username == rhs.username else { return false }
    return true
}
// MARK: - GetAllPostQuery.Data.GetAllPost.Edge.Tag AutoEquatable
extension GetAllPostQuery.Data.GetAllPost.Edge.Tag: Equatable {}
public func == (lhs: GetAllPostQuery.Data.GetAllPost.Edge.Tag, rhs: GetAllPostQuery.Data.GetAllPost.Edge.Tag) -> Bool {
    guard lhs.__typename == rhs.__typename else { return false }
    guard lhs.name == rhs.name else { return false }
    return true
}
// MARK: - GetAllPostQuery.Data.GetAllPost.Edge.Topic AutoEquatable
extension GetAllPostQuery.Data.GetAllPost.Edge.Topic: Equatable {}
public func == (lhs: GetAllPostQuery.Data.GetAllPost.Edge.Topic, rhs: GetAllPostQuery.Data.GetAllPost.Edge.Topic) -> Bool {
    guard lhs.__typename == rhs.__typename else { return false }
    guard lhs.name == rhs.name else { return false }
    return true
}
// MARK: - GetAllPostQuery.Data.GetAllPost.PageInfo AutoEquatable
extension GetAllPostQuery.Data.GetAllPost.PageInfo: Equatable {}
public func == (lhs: GetAllPostQuery.Data.GetAllPost.PageInfo, rhs: GetAllPostQuery.Data.GetAllPost.PageInfo) -> Bool {
    guard lhs.__typename == rhs.__typename else { return false }
    guard lhs.hasNextPage == rhs.hasNextPage else { return false }
    guard compareOptionals(lhs: lhs.endCursor, rhs: rhs.endCursor, compare: ==) else { return false }
    return true
}

// MARK: - AutoEquatable for Enums
