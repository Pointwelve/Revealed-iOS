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
// MARK: - CreatePostMutation.Data AutoEquatable
extension CreatePostMutation.Data: Equatable {}
public func == (lhs: CreatePostMutation.Data, rhs: CreatePostMutation.Data) -> Bool {
    guard compareOptionals(lhs: lhs.createPost, rhs: rhs.createPost, compare: ==) else { return false }
    return true
}
// MARK: - CreatePostMutation.Data.CreatePost AutoEquatable
extension CreatePostMutation.Data.CreatePost: Equatable {}
public func == (lhs: CreatePostMutation.Data.CreatePost, rhs: CreatePostMutation.Data.CreatePost) -> Bool {
    guard lhs.__typename == rhs.__typename else { return false }
    guard lhs.fragments == rhs.fragments else { return false }
    return true
}
// MARK: - CreatePostMutation.Data.CreatePost.Fragments AutoEquatable
extension CreatePostMutation.Data.CreatePost.Fragments: Equatable {}
public func == (lhs: CreatePostMutation.Data.CreatePost.Fragments, rhs: CreatePostMutation.Data.CreatePost.Fragments) -> Bool {
    guard lhs.postDetail == rhs.postDetail else { return false }
    return true
}
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
    guard lhs.fragments == rhs.fragments else { return false }
    return true
}
// MARK: - GetAllPostQuery.Data.GetAllPost.Edge.Fragments AutoEquatable
extension GetAllPostQuery.Data.GetAllPost.Edge.Fragments: Equatable {}
public func == (lhs: GetAllPostQuery.Data.GetAllPost.Edge.Fragments, rhs: GetAllPostQuery.Data.GetAllPost.Edge.Fragments) -> Bool {
    guard lhs.postDetail == rhs.postDetail else { return false }
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
// MARK: - PostDetail AutoEquatable
extension PostDetail: Equatable {}
public func == (lhs: PostDetail, rhs: PostDetail) -> Bool {
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
// MARK: - PostDetail.Author AutoEquatable
extension PostDetail.Author: Equatable {}
public func == (lhs: PostDetail.Author, rhs: PostDetail.Author) -> Bool {
    guard lhs.__typename == rhs.__typename else { return false }
    guard lhs.id == rhs.id else { return false }
    guard lhs.username == rhs.username else { return false }
    return true
}
// MARK: - PostDetail.Tag AutoEquatable
extension PostDetail.Tag: Equatable {}
public func == (lhs: PostDetail.Tag, rhs: PostDetail.Tag) -> Bool {
    guard lhs.__typename == rhs.__typename else { return false }
    guard lhs.name == rhs.name else { return false }
    return true
}
// MARK: - PostDetail.Topic AutoEquatable
extension PostDetail.Topic: Equatable {}
public func == (lhs: PostDetail.Topic, rhs: PostDetail.Topic) -> Bool {
    guard lhs.__typename == rhs.__typename else { return false }
    guard lhs.name == rhs.name else { return false }
    return true
}
// MARK: - QueryAllConfigsQuery.Data AutoEquatable
extension QueryAllConfigsQuery.Data: Equatable {}
public func == (lhs: QueryAllConfigsQuery.Data, rhs: QueryAllConfigsQuery.Data) -> Bool {
    guard compareOptionals(lhs: lhs.getAllTopics, rhs: rhs.getAllTopics, compare: ==) else { return false }
    guard compareOptionals(lhs: lhs.getAllTags, rhs: rhs.getAllTags, compare: ==) else { return false }
    return true
}
// MARK: - QueryAllConfigsQuery.Data.GetAllTag AutoEquatable
extension QueryAllConfigsQuery.Data.GetAllTag: Equatable {}
public func == (lhs: QueryAllConfigsQuery.Data.GetAllTag, rhs: QueryAllConfigsQuery.Data.GetAllTag) -> Bool {
    guard lhs.__typename == rhs.__typename else { return false }
    guard compareOptionals(lhs: lhs.edges, rhs: rhs.edges, compare: ==) else { return false }
    guard compareOptionals(lhs: lhs.pageInfo, rhs: rhs.pageInfo, compare: ==) else { return false }
    return true
}
// MARK: - QueryAllConfigsQuery.Data.GetAllTag.Edge AutoEquatable
extension QueryAllConfigsQuery.Data.GetAllTag.Edge: Equatable {}
public func == (lhs: QueryAllConfigsQuery.Data.GetAllTag.Edge, rhs: QueryAllConfigsQuery.Data.GetAllTag.Edge) -> Bool {
    guard lhs.__typename == rhs.__typename else { return false }
    guard lhs.id == rhs.id else { return false }
    guard lhs.name == rhs.name else { return false }
    return true
}
// MARK: - QueryAllConfigsQuery.Data.GetAllTag.PageInfo AutoEquatable
extension QueryAllConfigsQuery.Data.GetAllTag.PageInfo: Equatable {}
public func == (lhs: QueryAllConfigsQuery.Data.GetAllTag.PageInfo, rhs: QueryAllConfigsQuery.Data.GetAllTag.PageInfo) -> Bool {
    guard lhs.__typename == rhs.__typename else { return false }
    guard lhs.hasNextPage == rhs.hasNextPage else { return false }
    guard compareOptionals(lhs: lhs.endCursor, rhs: rhs.endCursor, compare: ==) else { return false }
    return true
}
// MARK: - QueryAllConfigsQuery.Data.GetAllTopic AutoEquatable
extension QueryAllConfigsQuery.Data.GetAllTopic: Equatable {}
public func == (lhs: QueryAllConfigsQuery.Data.GetAllTopic, rhs: QueryAllConfigsQuery.Data.GetAllTopic) -> Bool {
    guard lhs.__typename == rhs.__typename else { return false }
    guard compareOptionals(lhs: lhs.edges, rhs: rhs.edges, compare: ==) else { return false }
    guard compareOptionals(lhs: lhs.pageInfo, rhs: rhs.pageInfo, compare: ==) else { return false }
    return true
}
// MARK: - QueryAllConfigsQuery.Data.GetAllTopic.Edge AutoEquatable
extension QueryAllConfigsQuery.Data.GetAllTopic.Edge: Equatable {}
public func == (lhs: QueryAllConfigsQuery.Data.GetAllTopic.Edge, rhs: QueryAllConfigsQuery.Data.GetAllTopic.Edge) -> Bool {
    guard lhs.__typename == rhs.__typename else { return false }
    guard lhs.id == rhs.id else { return false }
    guard lhs.name == rhs.name else { return false }
    return true
}
// MARK: - QueryAllConfigsQuery.Data.GetAllTopic.PageInfo AutoEquatable
extension QueryAllConfigsQuery.Data.GetAllTopic.PageInfo: Equatable {}
public func == (lhs: QueryAllConfigsQuery.Data.GetAllTopic.PageInfo, rhs: QueryAllConfigsQuery.Data.GetAllTopic.PageInfo) -> Bool {
    guard lhs.__typename == rhs.__typename else { return false }
    guard lhs.hasNextPage == rhs.hasNextPage else { return false }
    guard compareOptionals(lhs: lhs.endCursor, rhs: rhs.endCursor, compare: ==) else { return false }
    return true
}

// MARK: - AutoEquatable for Enums
