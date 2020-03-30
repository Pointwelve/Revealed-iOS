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
// MARK: - CommentDetail AutoEquatable
extension CommentDetail: Equatable {}
public func == (lhs: CommentDetail, rhs: CommentDetail) -> Bool {
    guard lhs.__typename == rhs.__typename else { return false }
    guard lhs.id == rhs.id else { return false }
    guard lhs.author == rhs.author else { return false }
    guard lhs.content == rhs.content else { return false }
    guard lhs.createdAt == rhs.createdAt else { return false }
    return true
}
// MARK: - CommentDetail.Author AutoEquatable
extension CommentDetail.Author: Equatable {}
public func == (lhs: CommentDetail.Author, rhs: CommentDetail.Author) -> Bool {
    guard lhs.__typename == rhs.__typename else { return false }
    guard lhs.fragments == rhs.fragments else { return false }
    return true
}
// MARK: - CommentDetail.Author.Fragments AutoEquatable
extension CommentDetail.Author.Fragments: Equatable {}
public func == (lhs: CommentDetail.Author.Fragments, rhs: CommentDetail.Author.Fragments) -> Bool {
    guard lhs.userDetail == rhs.userDetail else { return false }
    return true
}
// MARK: - CreateCommentMutation.Data AutoEquatable
extension CreateCommentMutation.Data: Equatable {}
public func == (lhs: CreateCommentMutation.Data, rhs: CreateCommentMutation.Data) -> Bool {
    guard lhs.createComment == rhs.createComment else { return false }
    return true
}
// MARK: - CreateCommentMutation.Data.CreateComment AutoEquatable
extension CreateCommentMutation.Data.CreateComment: Equatable {}
public func == (lhs: CreateCommentMutation.Data.CreateComment, rhs: CreateCommentMutation.Data.CreateComment) -> Bool {
    guard lhs.__typename == rhs.__typename else { return false }
    guard lhs.fragments == rhs.fragments else { return false }
    return true
}
// MARK: - CreateCommentMutation.Data.CreateComment.Fragments AutoEquatable
extension CreateCommentMutation.Data.CreateComment.Fragments: Equatable {}
public func == (lhs: CreateCommentMutation.Data.CreateComment.Fragments, rhs: CreateCommentMutation.Data.CreateComment.Fragments) -> Bool {
    guard lhs.commentDetail == rhs.commentDetail else { return false }
    return true
}
// MARK: - CreatePostMutation.Data AutoEquatable
extension CreatePostMutation.Data: Equatable {}
public func == (lhs: CreatePostMutation.Data, rhs: CreatePostMutation.Data) -> Bool {
    guard lhs.createPost == rhs.createPost else { return false }
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
// MARK: - GetAllConfigsQuery.Data AutoEquatable
extension GetAllConfigsQuery.Data: Equatable {}
public func == (lhs: GetAllConfigsQuery.Data, rhs: GetAllConfigsQuery.Data) -> Bool {
    guard lhs.getAllTopics == rhs.getAllTopics else { return false }
    guard lhs.getAllTags == rhs.getAllTags else { return false }
    return true
}
// MARK: - GetAllConfigsQuery.Data.GetAllTag AutoEquatable
extension GetAllConfigsQuery.Data.GetAllTag: Equatable {}
public func == (lhs: GetAllConfigsQuery.Data.GetAllTag, rhs: GetAllConfigsQuery.Data.GetAllTag) -> Bool {
    guard lhs.__typename == rhs.__typename else { return false }
    guard compareOptionals(lhs: lhs.edges, rhs: rhs.edges, compare: ==) else { return false }
    guard lhs.pageInfo == rhs.pageInfo else { return false }
    return true
}
// MARK: - GetAllConfigsQuery.Data.GetAllTag.Edge AutoEquatable
extension GetAllConfigsQuery.Data.GetAllTag.Edge: Equatable {}
public func == (lhs: GetAllConfigsQuery.Data.GetAllTag.Edge, rhs: GetAllConfigsQuery.Data.GetAllTag.Edge) -> Bool {
    guard lhs.__typename == rhs.__typename else { return false }
    guard lhs.id == rhs.id else { return false }
    guard lhs.name == rhs.name else { return false }
    return true
}
// MARK: - GetAllConfigsQuery.Data.GetAllTag.PageInfo AutoEquatable
extension GetAllConfigsQuery.Data.GetAllTag.PageInfo: Equatable {}
public func == (lhs: GetAllConfigsQuery.Data.GetAllTag.PageInfo, rhs: GetAllConfigsQuery.Data.GetAllTag.PageInfo) -> Bool {
    guard lhs.__typename == rhs.__typename else { return false }
    guard lhs.hasNextPage == rhs.hasNextPage else { return false }
    guard compareOptionals(lhs: lhs.endCursor, rhs: rhs.endCursor, compare: ==) else { return false }
    return true
}
// MARK: - GetAllConfigsQuery.Data.GetAllTopic AutoEquatable
extension GetAllConfigsQuery.Data.GetAllTopic: Equatable {}
public func == (lhs: GetAllConfigsQuery.Data.GetAllTopic, rhs: GetAllConfigsQuery.Data.GetAllTopic) -> Bool {
    guard lhs.__typename == rhs.__typename else { return false }
    guard compareOptionals(lhs: lhs.edges, rhs: rhs.edges, compare: ==) else { return false }
    guard lhs.pageInfo == rhs.pageInfo else { return false }
    return true
}
// MARK: - GetAllConfigsQuery.Data.GetAllTopic.Edge AutoEquatable
extension GetAllConfigsQuery.Data.GetAllTopic.Edge: Equatable {}
public func == (lhs: GetAllConfigsQuery.Data.GetAllTopic.Edge, rhs: GetAllConfigsQuery.Data.GetAllTopic.Edge) -> Bool {
    guard lhs.__typename == rhs.__typename else { return false }
    guard lhs.id == rhs.id else { return false }
    guard lhs.name == rhs.name else { return false }
    return true
}
// MARK: - GetAllConfigsQuery.Data.GetAllTopic.PageInfo AutoEquatable
extension GetAllConfigsQuery.Data.GetAllTopic.PageInfo: Equatable {}
public func == (lhs: GetAllConfigsQuery.Data.GetAllTopic.PageInfo, rhs: GetAllConfigsQuery.Data.GetAllTopic.PageInfo) -> Bool {
    guard lhs.__typename == rhs.__typename else { return false }
    guard lhs.hasNextPage == rhs.hasNextPage else { return false }
    guard compareOptionals(lhs: lhs.endCursor, rhs: rhs.endCursor, compare: ==) else { return false }
    return true
}
// MARK: - GetAllPostQuery.Data AutoEquatable
extension GetAllPostQuery.Data: Equatable {}
public func == (lhs: GetAllPostQuery.Data, rhs: GetAllPostQuery.Data) -> Bool {
    guard lhs.getAllPosts == rhs.getAllPosts else { return false }
    return true
}
// MARK: - GetAllPostQuery.Data.GetAllPost AutoEquatable
extension GetAllPostQuery.Data.GetAllPost: Equatable {}
public func == (lhs: GetAllPostQuery.Data.GetAllPost, rhs: GetAllPostQuery.Data.GetAllPost) -> Bool {
    guard lhs.__typename == rhs.__typename else { return false }
    guard compareOptionals(lhs: lhs.edges, rhs: rhs.edges, compare: ==) else { return false }
    guard lhs.pageInfo == rhs.pageInfo else { return false }
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
    guard lhs.content == rhs.content else { return false }
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
// MARK: - PostSignupMutation.Data AutoEquatable
extension PostSignupMutation.Data: Equatable {}
public func == (lhs: PostSignupMutation.Data, rhs: PostSignupMutation.Data) -> Bool {
    guard lhs.postSignup == rhs.postSignup else { return false }
    return true
}
// MARK: - PostSignupMutation.Data.PostSignup AutoEquatable
extension PostSignupMutation.Data.PostSignup: Equatable {}
public func == (lhs: PostSignupMutation.Data.PostSignup, rhs: PostSignupMutation.Data.PostSignup) -> Bool {
    guard lhs.__typename == rhs.__typename else { return false }
    guard lhs.user == rhs.user else { return false }
    return true
}
// MARK: - PostSignupMutation.Data.PostSignup.User AutoEquatable
extension PostSignupMutation.Data.PostSignup.User: Equatable {}
public func == (lhs: PostSignupMutation.Data.PostSignup.User, rhs: PostSignupMutation.Data.PostSignup.User) -> Bool {
    guard lhs.__typename == rhs.__typename else { return false }
    guard lhs.fragments == rhs.fragments else { return false }
    return true
}
// MARK: - PostSignupMutation.Data.PostSignup.User.Fragments AutoEquatable
extension PostSignupMutation.Data.PostSignup.User.Fragments: Equatable {}
public func == (lhs: PostSignupMutation.Data.PostSignup.User.Fragments, rhs: PostSignupMutation.Data.PostSignup.User.Fragments) -> Bool {
    guard lhs.userDetail == rhs.userDetail else { return false }
    return true
}
// MARK: - UserDetail AutoEquatable
extension UserDetail: Equatable {}
public func == (lhs: UserDetail, rhs: UserDetail) -> Bool {
    guard lhs.__typename == rhs.__typename else { return false }
    guard lhs.id == rhs.id else { return false }
    guard lhs.email == rhs.email else { return false }
    guard lhs.username == rhs.username else { return false }
    return true
}

// MARK: - AutoEquatable for Enums
