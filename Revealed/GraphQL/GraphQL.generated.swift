//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

/// Inputs
public struct PostInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(subject: String, content: String, topicId: String, tagIds: [String]) {
    graphQLMap = ["subject": subject, "content": content, "topicId": topicId, "tagIds": tagIds]
  }

  public var subject: String {
    get {
      return graphQLMap["subject"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "subject")
    }
  }

  public var content: String {
    get {
      return graphQLMap["content"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "content")
    }
  }

  public var topicId: String {
    get {
      return graphQLMap["topicId"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "topicId")
    }
  }

  public var tagIds: [String] {
    get {
      return graphQLMap["tagIds"] as! [String]
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "tagIds")
    }
  }
}

public enum PostStatus: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  case new
  case approved
  case blocked
  case deleted
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "NEW": self = .new
      case "APPROVED": self = .approved
      case "BLOCKED": self = .blocked
      case "DELETED": self = .deleted
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .new: return "NEW"
      case .approved: return "APPROVED"
      case .blocked: return "BLOCKED"
      case .deleted: return "DELETED"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: PostStatus, rhs: PostStatus) -> Bool {
    switch (lhs, rhs) {
      case (.new, .new): return true
      case (.approved, .approved): return true
      case (.blocked, .blocked): return true
      case (.deleted, .deleted): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [PostStatus] {
    return [
      .new,
      .approved,
      .blocked,
      .deleted,
    ]
  }
}

public final class CreatePostMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition =
    """
    mutation CreatePost($input: PostInput!) {
      createPost(input: $input) {
        __typename
        ...PostDetail
      }
    }
    """

  public let operationName = "CreatePost"

  public var queryDocument: String { return operationDefinition.appending(PostDetail.fragmentDefinition) }

  public var input: PostInput

  public init(input: PostInput) {
    self.input = input
  }

  public var variables: GraphQLMap? {
    return ["input": input]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("createPost", arguments: ["input": GraphQLVariable("input")], type: .object(CreatePost.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(createPost: CreatePost? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "createPost": createPost.flatMap { (value: CreatePost) -> ResultMap in value.resultMap }])
    }

    public var createPost: CreatePost? {
      get {
        return (resultMap["createPost"] as? ResultMap).flatMap { CreatePost(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "createPost")
      }
    }

    public struct CreatePost: GraphQLSelectionSet {
      public static let possibleTypes = ["Post"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLFragmentSpread(PostDetail.self),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }

      public struct Fragments {
        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var postDetail: PostDetail {
          get {
            return PostDetail(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }
      }
    }
  }
}

public final class QueryAllConfigsQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition =
    """
    query queryAllConfigs {
      getAllTopics {
        __typename
        edges {
          __typename
          id
          name
        }
      }
      getAllTags {
        __typename
        edges {
          __typename
          id
          name
        }
      }
    }
    """

  public let operationName = "queryAllConfigs"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("getAllTopics", type: .object(GetAllTopic.selections)),
      GraphQLField("getAllTags", type: .object(GetAllTag.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(getAllTopics: GetAllTopic? = nil, getAllTags: GetAllTag? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "getAllTopics": getAllTopics.flatMap { (value: GetAllTopic) -> ResultMap in value.resultMap }, "getAllTags": getAllTags.flatMap { (value: GetAllTag) -> ResultMap in value.resultMap }])
    }

    /// First is number of posts. after is nullable
    public var getAllTopics: GetAllTopic? {
      get {
        return (resultMap["getAllTopics"] as? ResultMap).flatMap { GetAllTopic(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "getAllTopics")
      }
    }

    public var getAllTags: GetAllTag? {
      get {
        return (resultMap["getAllTags"] as? ResultMap).flatMap { GetAllTag(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "getAllTags")
      }
    }

    public struct GetAllTopic: GraphQLSelectionSet {
      public static let possibleTypes = ["TopicConnection"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("edges", type: .list(.object(Edge.selections))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(edges: [Edge?]? = nil) {
        self.init(unsafeResultMap: ["__typename": "TopicConnection", "edges": edges.flatMap { (value: [Edge?]) -> [ResultMap?] in value.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } } }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var edges: [Edge?]? {
        get {
          return (resultMap["edges"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Edge?] in value.map { (value: ResultMap?) -> Edge? in value.flatMap { (value: ResultMap) -> Edge in Edge(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Edge?]) -> [ResultMap?] in value.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } } }, forKey: "edges")
        }
      }

      public struct Edge: GraphQLSelectionSet {
        public static let possibleTypes = ["Topic"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("name", type: .nonNull(.scalar(String.self))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, name: String) {
          self.init(unsafeResultMap: ["__typename": "Topic", "id": id, "name": name])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return resultMap["id"]! as! GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var name: String {
          get {
            return resultMap["name"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "name")
          }
        }
      }
    }

    public struct GetAllTag: GraphQLSelectionSet {
      public static let possibleTypes = ["TagConnection"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("edges", type: .list(.object(Edge.selections))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(edges: [Edge?]? = nil) {
        self.init(unsafeResultMap: ["__typename": "TagConnection", "edges": edges.flatMap { (value: [Edge?]) -> [ResultMap?] in value.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } } }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var edges: [Edge?]? {
        get {
          return (resultMap["edges"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Edge?] in value.map { (value: ResultMap?) -> Edge? in value.flatMap { (value: ResultMap) -> Edge in Edge(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Edge?]) -> [ResultMap?] in value.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } } }, forKey: "edges")
        }
      }

      public struct Edge: GraphQLSelectionSet {
        public static let possibleTypes = ["Tag"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("name", type: .nonNull(.scalar(String.self))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, name: String) {
          self.init(unsafeResultMap: ["__typename": "Tag", "id": id, "name": name])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return resultMap["id"]! as! GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var name: String {
          get {
            return resultMap["name"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "name")
          }
        }
      }
    }
  }
}

public final class GetAllPostQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition =
    """
    query getAllPost($first: Int, $commentFirst: String) {
      getAllPosts(first: $first, after: $commentFirst) {
        __typename
        edges {
          __typename
          ...PostDetail
        }
        pageInfo {
          __typename
          hasNextPage
          endCursor
        }
      }
    }
    """

  public let operationName = "getAllPost"

  public var queryDocument: String { return operationDefinition.appending(PostDetail.fragmentDefinition) }

  public var first: Int?
  public var commentFirst: String?

  public init(first: Int? = nil, commentFirst: String? = nil) {
    self.first = first
    self.commentFirst = commentFirst
  }

  public var variables: GraphQLMap? {
    return ["first": first, "commentFirst": commentFirst]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("getAllPosts", arguments: ["first": GraphQLVariable("first"), "after": GraphQLVariable("commentFirst")], type: .object(GetAllPost.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(getAllPosts: GetAllPost? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "getAllPosts": getAllPosts.flatMap { (value: GetAllPost) -> ResultMap in value.resultMap }])
    }

    public var getAllPosts: GetAllPost? {
      get {
        return (resultMap["getAllPosts"] as? ResultMap).flatMap { GetAllPost(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "getAllPosts")
      }
    }

    public struct GetAllPost: GraphQLSelectionSet {
      public static let possibleTypes = ["PostConnection"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("edges", type: .list(.object(Edge.selections))),
        GraphQLField("pageInfo", type: .object(PageInfo.selections)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(edges: [Edge?]? = nil, pageInfo: PageInfo? = nil) {
        self.init(unsafeResultMap: ["__typename": "PostConnection", "edges": edges.flatMap { (value: [Edge?]) -> [ResultMap?] in value.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } } }, "pageInfo": pageInfo.flatMap { (value: PageInfo) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var edges: [Edge?]? {
        get {
          return (resultMap["edges"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Edge?] in value.map { (value: ResultMap?) -> Edge? in value.flatMap { (value: ResultMap) -> Edge in Edge(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Edge?]) -> [ResultMap?] in value.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } } }, forKey: "edges")
        }
      }

      public var pageInfo: PageInfo? {
        get {
          return (resultMap["pageInfo"] as? ResultMap).flatMap { PageInfo(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "pageInfo")
        }
      }

      public struct Edge: GraphQLSelectionSet {
        public static let possibleTypes = ["Post"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(PostDetail.self),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }

        public struct Fragments {
          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var postDetail: PostDetail {
            get {
              return PostDetail(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }
        }
      }

      public struct PageInfo: GraphQLSelectionSet {
        public static let possibleTypes = ["PageInfo"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("hasNextPage", type: .nonNull(.scalar(Bool.self))),
          GraphQLField("endCursor", type: .scalar(String.self)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(hasNextPage: Bool, endCursor: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "PageInfo", "hasNextPage": hasNextPage, "endCursor": endCursor])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var hasNextPage: Bool {
          get {
            return resultMap["hasNextPage"]! as! Bool
          }
          set {
            resultMap.updateValue(newValue, forKey: "hasNextPage")
          }
        }

        public var endCursor: String? {
          get {
            return resultMap["endCursor"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "endCursor")
          }
        }
      }
    }
  }
}

public struct PostDetail: GraphQLFragment {
  /// The raw GraphQL definition of this fragment.
  public static let fragmentDefinition =
    """
    fragment PostDetail on Post {
      __typename
      author {
        __typename
        id
        username
      }
      tags {
        __typename
        name
      }
      topic {
        __typename
        name
      }
      id
      excerpt
      subject
      createdAt
      totalLikesCount
      totalCommentsCount
      postViewCount
      status
    }
    """

  public static let possibleTypes = ["Post"]

  public static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("author", type: .nonNull(.object(Author.selections))),
    GraphQLField("tags", type: .list(.nonNull(.object(Tag.selections)))),
    GraphQLField("topic", type: .nonNull(.object(Topic.selections))),
    GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
    GraphQLField("excerpt", type: .nonNull(.scalar(String.self))),
    GraphQLField("subject", type: .nonNull(.scalar(String.self))),
    GraphQLField("createdAt", type: .nonNull(.scalar(Int.self))),
    GraphQLField("totalLikesCount", type: .nonNull(.scalar(Int.self))),
    GraphQLField("totalCommentsCount", type: .nonNull(.scalar(Int.self))),
    GraphQLField("postViewCount", type: .nonNull(.scalar(Int.self))),
    GraphQLField("status", type: .nonNull(.scalar(PostStatus.self))),
  ]

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(author: Author, tags: [Tag]? = nil, topic: Topic, id: GraphQLID, excerpt: String, subject: String, createdAt: Int, totalLikesCount: Int, totalCommentsCount: Int, postViewCount: Int, status: PostStatus) {
    self.init(unsafeResultMap: ["__typename": "Post", "author": author.resultMap, "tags": tags.flatMap { (value: [Tag]) -> [ResultMap] in value.map { (value: Tag) -> ResultMap in value.resultMap } }, "topic": topic.resultMap, "id": id, "excerpt": excerpt, "subject": subject, "createdAt": createdAt, "totalLikesCount": totalLikesCount, "totalCommentsCount": totalCommentsCount, "postViewCount": postViewCount, "status": status])
  }

  public var __typename: String {
    get {
      return resultMap["__typename"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "__typename")
    }
  }

  public var author: Author {
    get {
      return Author(unsafeResultMap: resultMap["author"]! as! ResultMap)
    }
    set {
      resultMap.updateValue(newValue.resultMap, forKey: "author")
    }
  }

  /// In Blind. All Page view is calculated when user goes into pagedetail
  public var tags: [Tag]? {
    get {
      return (resultMap["tags"] as? [ResultMap]).flatMap { (value: [ResultMap]) -> [Tag] in value.map { (value: ResultMap) -> Tag in Tag(unsafeResultMap: value) } }
    }
    set {
      resultMap.updateValue(newValue.flatMap { (value: [Tag]) -> [ResultMap] in value.map { (value: Tag) -> ResultMap in value.resultMap } }, forKey: "tags")
    }
  }

  public var topic: Topic {
    get {
      return Topic(unsafeResultMap: resultMap["topic"]! as! ResultMap)
    }
    set {
      resultMap.updateValue(newValue.resultMap, forKey: "topic")
    }
  }

  public var id: GraphQLID {
    get {
      return resultMap["id"]! as! GraphQLID
    }
    set {
      resultMap.updateValue(newValue, forKey: "id")
    }
  }

  public var excerpt: String {
    get {
      return resultMap["excerpt"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "excerpt")
    }
  }

  public var subject: String {
    get {
      return resultMap["subject"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "subject")
    }
  }

  /// MARKDOWN only and unicode (emoji)
  public var createdAt: Int {
    get {
      return resultMap["createdAt"]! as! Int
    }
    set {
      resultMap.updateValue(newValue, forKey: "createdAt")
    }
  }

  public var totalLikesCount: Int {
    get {
      return resultMap["totalLikesCount"]! as! Int
    }
    set {
      resultMap.updateValue(newValue, forKey: "totalLikesCount")
    }
  }

  public var totalCommentsCount: Int {
    get {
      return resultMap["totalCommentsCount"]! as! Int
    }
    set {
      resultMap.updateValue(newValue, forKey: "totalCommentsCount")
    }
  }

  public var postViewCount: Int {
    get {
      return resultMap["postViewCount"]! as! Int
    }
    set {
      resultMap.updateValue(newValue, forKey: "postViewCount")
    }
  }

  /// Resolve single invoke
  public var status: PostStatus {
    get {
      return resultMap["status"]! as! PostStatus
    }
    set {
      resultMap.updateValue(newValue, forKey: "status")
    }
  }

  public struct Author: GraphQLSelectionSet {
    public static let possibleTypes = ["User"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
      GraphQLField("username", type: .nonNull(.scalar(String.self))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(id: GraphQLID, username: String) {
      self.init(unsafeResultMap: ["__typename": "User", "id": id, "username": username])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    public var id: GraphQLID {
      get {
        return resultMap["id"]! as! GraphQLID
      }
      set {
        resultMap.updateValue(newValue, forKey: "id")
      }
    }

    public var username: String {
      get {
        return resultMap["username"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "username")
      }
    }
  }

  public struct Tag: GraphQLSelectionSet {
    public static let possibleTypes = ["Tag"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("name", type: .nonNull(.scalar(String.self))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(name: String) {
      self.init(unsafeResultMap: ["__typename": "Tag", "name": name])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    public var name: String {
      get {
        return resultMap["name"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "name")
      }
    }
  }

  public struct Topic: GraphQLSelectionSet {
    public static let possibleTypes = ["Topic"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("name", type: .nonNull(.scalar(String.self))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(name: String) {
      self.init(unsafeResultMap: ["__typename": "Topic", "name": name])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    public var name: String {
      get {
        return resultMap["name"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "name")
      }
    }
  }
}
