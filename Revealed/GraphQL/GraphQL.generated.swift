// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public struct CommentInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - postId
  ///   - content
  public init(postId: String, content: String) {
    graphQLMap = ["postId": postId, "content": content]
  }

  public var postId: String {
    get {
      return graphQLMap["postId"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "postId")
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
}

/// Inputs
public struct PostInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - subject
  ///   - content
  ///   - topicId
  ///   - tagIds
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

public struct PostSignupInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - username
  ///   - device
  public init(username: String, device: DeviceInput?? = nil) {
    graphQLMap = ["username": username, "device": device]
  }

  public var username: String {
    get {
      return graphQLMap["username"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "username")
    }
  }

  public var device: DeviceInput?? {
    get {
      return graphQLMap["device"] as? DeviceInput?? ?? Swift.Optional<DeviceInput?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "device")
    }
  }
}

public struct DeviceInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - token
  ///   - platform
  public init(token: String, platform: Platform) {
    graphQLMap = ["token": token, "platform": platform]
  }

  public var token: String {
    get {
      return graphQLMap["token"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "token")
    }
  }

  public var platform: Platform {
    get {
      return graphQLMap["platform"] as! Platform
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "platform")
    }
  }
}

public enum Platform: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  case ios
  case android
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "IOS": self = .ios
      case "ANDROID": self = .android
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .ios: return "IOS"
      case .android: return "ANDROID"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: Platform, rhs: Platform) -> Bool {
    switch (lhs, rhs) {
      case (.ios, .ios): return true
      case (.android, .android): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [Platform] {
    return [
      .ios,
      .android,
    ]
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

public final class CreateCommentMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation CreateComment($input: CommentInput!) {
      createComment(input: $input) {
        __typename
        ...CommentDetail
      }
    }
    """

  public let operationName: String = "CreateComment"

  public var queryDocument: String { return operationDefinition.appending(CommentDetail.fragmentDefinition).appending(UserDetail.fragmentDefinition) }

  public var input: CommentInput

  public init(input: CommentInput) {
    self.input = input
  }

  public var variables: GraphQLMap? {
    return ["input": input]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("createComment", arguments: ["input": GraphQLVariable("input")], type: .nonNull(.object(CreateComment.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(createComment: CreateComment) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "createComment": createComment.resultMap])
    }

    public var createComment: CreateComment {
      get {
        return CreateComment(unsafeResultMap: resultMap["createComment"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "createComment")
      }
    }

    public struct CreateComment: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Comment"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLFragmentSpread(CommentDetail.self),
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

        public var commentDetail: CommentDetail {
          get {
            return CommentDetail(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }
      }
    }
  }
}

public final class CreatePostMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation CreatePost($input: PostInput!) {
      createPost(input: $input) {
        __typename
        ...PostDetail
      }
    }
    """

  public let operationName: String = "CreatePost"

  public var queryDocument: String { return operationDefinition.appending(PostDetail.fragmentDefinition) }

  public var input: PostInput

  public init(input: PostInput) {
    self.input = input
  }

  public var variables: GraphQLMap? {
    return ["input": input]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("createPost", arguments: ["input": GraphQLVariable("input")], type: .nonNull(.object(CreatePost.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(createPost: CreatePost) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "createPost": createPost.resultMap])
    }

    public var createPost: CreatePost {
      get {
        return CreatePost(unsafeResultMap: resultMap["createPost"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "createPost")
      }
    }

    public struct CreatePost: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Post"]

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

public final class GetAllConfigsQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query getAllConfigs {
      getAllTopics {
        __typename
        edges {
          __typename
          id
          name
        }
        pageInfo {
          __typename
          hasNextPage
          endCursor
        }
      }
      getAllTags {
        __typename
        edges {
          __typename
          id
          name
        }
        pageInfo {
          __typename
          hasNextPage
          endCursor
        }
      }
    }
    """

  public let operationName: String = "getAllConfigs"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("getAllTopics", type: .nonNull(.object(GetAllTopic.selections))),
      GraphQLField("getAllTags", type: .nonNull(.object(GetAllTag.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(getAllTopics: GetAllTopic, getAllTags: GetAllTag) {
      self.init(unsafeResultMap: ["__typename": "Query", "getAllTopics": getAllTopics.resultMap, "getAllTags": getAllTags.resultMap])
    }

    /// First is number of posts. after is nullable
    public var getAllTopics: GetAllTopic {
      get {
        return GetAllTopic(unsafeResultMap: resultMap["getAllTopics"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "getAllTopics")
      }
    }

    public var getAllTags: GetAllTag {
      get {
        return GetAllTag(unsafeResultMap: resultMap["getAllTags"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "getAllTags")
      }
    }

    public struct GetAllTopic: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["TopicConnection"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("edges", type: .list(.nonNull(.object(Edge.selections)))),
        GraphQLField("pageInfo", type: .nonNull(.object(PageInfo.selections))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(edges: [Edge]? = nil, pageInfo: PageInfo) {
        self.init(unsafeResultMap: ["__typename": "TopicConnection", "edges": edges.flatMap { (value: [Edge]) -> [ResultMap] in value.map { (value: Edge) -> ResultMap in value.resultMap } }, "pageInfo": pageInfo.resultMap])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var edges: [Edge]? {
        get {
          return (resultMap["edges"] as? [ResultMap]).flatMap { (value: [ResultMap]) -> [Edge] in value.map { (value: ResultMap) -> Edge in Edge(unsafeResultMap: value) } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Edge]) -> [ResultMap] in value.map { (value: Edge) -> ResultMap in value.resultMap } }, forKey: "edges")
        }
      }

      public var pageInfo: PageInfo {
        get {
          return PageInfo(unsafeResultMap: resultMap["pageInfo"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "pageInfo")
        }
      }

      public struct Edge: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Topic"]

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

      public struct PageInfo: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["PageInfo"]

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

    public struct GetAllTag: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["TagConnection"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("edges", type: .list(.nonNull(.object(Edge.selections)))),
        GraphQLField("pageInfo", type: .nonNull(.object(PageInfo.selections))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(edges: [Edge]? = nil, pageInfo: PageInfo) {
        self.init(unsafeResultMap: ["__typename": "TagConnection", "edges": edges.flatMap { (value: [Edge]) -> [ResultMap] in value.map { (value: Edge) -> ResultMap in value.resultMap } }, "pageInfo": pageInfo.resultMap])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var edges: [Edge]? {
        get {
          return (resultMap["edges"] as? [ResultMap]).flatMap { (value: [ResultMap]) -> [Edge] in value.map { (value: ResultMap) -> Edge in Edge(unsafeResultMap: value) } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Edge]) -> [ResultMap] in value.map { (value: Edge) -> ResultMap in value.resultMap } }, forKey: "edges")
        }
      }

      public var pageInfo: PageInfo {
        get {
          return PageInfo(unsafeResultMap: resultMap["pageInfo"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "pageInfo")
        }
      }

      public struct Edge: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Tag"]

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

      public struct PageInfo: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["PageInfo"]

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

public final class GetAllPostQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
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

  public let operationName: String = "getAllPost"

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
    public static let possibleTypes: [String] = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("getAllPosts", arguments: ["first": GraphQLVariable("first"), "after": GraphQLVariable("commentFirst")], type: .nonNull(.object(GetAllPost.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(getAllPosts: GetAllPost) {
      self.init(unsafeResultMap: ["__typename": "Query", "getAllPosts": getAllPosts.resultMap])
    }

    public var getAllPosts: GetAllPost {
      get {
        return GetAllPost(unsafeResultMap: resultMap["getAllPosts"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "getAllPosts")
      }
    }

    public struct GetAllPost: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["PostConnection"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("edges", type: .list(.nonNull(.object(Edge.selections)))),
        GraphQLField("pageInfo", type: .nonNull(.object(PageInfo.selections))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(edges: [Edge]? = nil, pageInfo: PageInfo) {
        self.init(unsafeResultMap: ["__typename": "PostConnection", "edges": edges.flatMap { (value: [Edge]) -> [ResultMap] in value.map { (value: Edge) -> ResultMap in value.resultMap } }, "pageInfo": pageInfo.resultMap])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var edges: [Edge]? {
        get {
          return (resultMap["edges"] as? [ResultMap]).flatMap { (value: [ResultMap]) -> [Edge] in value.map { (value: ResultMap) -> Edge in Edge(unsafeResultMap: value) } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Edge]) -> [ResultMap] in value.map { (value: Edge) -> ResultMap in value.resultMap } }, forKey: "edges")
        }
      }

      public var pageInfo: PageInfo {
        get {
          return PageInfo(unsafeResultMap: resultMap["pageInfo"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "pageInfo")
        }
      }

      public struct Edge: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Post"]

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
        public static let possibleTypes: [String] = ["PageInfo"]

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

public final class PostSignupMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation PostSignup($input: PostSignupInput!) {
      postSignup(input: $input) {
        __typename
        user {
          __typename
          ...UserDetail
        }
      }
    }
    """

  public let operationName: String = "PostSignup"

  public var queryDocument: String { return operationDefinition.appending(UserDetail.fragmentDefinition) }

  public var input: PostSignupInput

  public init(input: PostSignupInput) {
    self.input = input
  }

  public var variables: GraphQLMap? {
    return ["input": input]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("postSignup", arguments: ["input": GraphQLVariable("input")], type: .nonNull(.object(PostSignup.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(postSignup: PostSignup) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "postSignup": postSignup.resultMap])
    }

    public var postSignup: PostSignup {
      get {
        return PostSignup(unsafeResultMap: resultMap["postSignup"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "postSignup")
      }
    }

    public struct PostSignup: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["PostSignupResponse"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("user", type: .nonNull(.object(User.selections))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(user: User) {
        self.init(unsafeResultMap: ["__typename": "PostSignupResponse", "user": user.resultMap])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var user: User {
        get {
          return User(unsafeResultMap: resultMap["user"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "user")
        }
      }

      public struct User: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["User"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(UserDetail.self),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, email: String, username: String) {
          self.init(unsafeResultMap: ["__typename": "User", "id": id, "email": email, "username": username])
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

          public var userDetail: UserDetail {
            get {
              return UserDetail(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }
        }
      }
    }
  }
}

public struct PostDetail: GraphQLFragment {
  /// The raw GraphQL definition of this fragment.
  public static let fragmentDefinition: String =
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
      content
      excerpt
      subject
      createdAt
      totalLikesCount
      totalCommentsCount
      postViewCount
      status
    }
    """

  public static let possibleTypes: [String] = ["Post"]

  public static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("author", type: .nonNull(.object(Author.selections))),
    GraphQLField("tags", type: .list(.nonNull(.object(Tag.selections)))),
    GraphQLField("topic", type: .nonNull(.object(Topic.selections))),
    GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
    GraphQLField("content", type: .nonNull(.scalar(String.self))),
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

  public init(author: Author, tags: [Tag]? = nil, topic: Topic, id: GraphQLID, content: String, excerpt: String, subject: String, createdAt: Int, totalLikesCount: Int, totalCommentsCount: Int, postViewCount: Int, status: PostStatus) {
    self.init(unsafeResultMap: ["__typename": "Post", "author": author.resultMap, "tags": tags.flatMap { (value: [Tag]) -> [ResultMap] in value.map { (value: Tag) -> ResultMap in value.resultMap } }, "topic": topic.resultMap, "id": id, "content": content, "excerpt": excerpt, "subject": subject, "createdAt": createdAt, "totalLikesCount": totalLikesCount, "totalCommentsCount": totalCommentsCount, "postViewCount": postViewCount, "status": status])
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

  public var content: String {
    get {
      return resultMap["content"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "content")
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

  // MARK: only and unicode (emoji)
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
    public static let possibleTypes: [String] = ["User"]

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
    public static let possibleTypes: [String] = ["Tag"]

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
    public static let possibleTypes: [String] = ["Topic"]

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

public struct UserDetail: GraphQLFragment {
  /// The raw GraphQL definition of this fragment.
  public static let fragmentDefinition: String =
    """
    fragment UserDetail on User {
      __typename
      id
      email
      username
    }
    """

  public static let possibleTypes: [String] = ["User"]

  public static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
    GraphQLField("email", type: .nonNull(.scalar(String.self))),
    GraphQLField("username", type: .nonNull(.scalar(String.self))),
  ]

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(id: GraphQLID, email: String, username: String) {
    self.init(unsafeResultMap: ["__typename": "User", "id": id, "email": email, "username": username])
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

  public var email: String {
    get {
      return resultMap["email"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "email")
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

public struct CommentDetail: GraphQLFragment {
  /// The raw GraphQL definition of this fragment.
  public static let fragmentDefinition: String =
    """
    fragment CommentDetail on Comment {
      __typename
      id
      author {
        __typename
        ...UserDetail
      }
      content
      createdAt
    }
    """

  public static let possibleTypes: [String] = ["Comment"]

  public static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
    GraphQLField("author", type: .nonNull(.object(Author.selections))),
    GraphQLField("content", type: .nonNull(.scalar(String.self))),
    GraphQLField("createdAt", type: .nonNull(.scalar(Int.self))),
  ]

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(id: GraphQLID, author: Author, content: String, createdAt: Int) {
    self.init(unsafeResultMap: ["__typename": "Comment", "id": id, "author": author.resultMap, "content": content, "createdAt": createdAt])
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

  public var author: Author {
    get {
      return Author(unsafeResultMap: resultMap["author"]! as! ResultMap)
    }
    set {
      resultMap.updateValue(newValue.resultMap, forKey: "author")
    }
  }

  public var content: String {
    get {
      return resultMap["content"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "content")
    }
  }

  public var createdAt: Int {
    get {
      return resultMap["createdAt"]! as! Int
    }
    set {
      resultMap.updateValue(newValue, forKey: "createdAt")
    }
  }

  public struct Author: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["User"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLFragmentSpread(UserDetail.self),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(id: GraphQLID, email: String, username: String) {
      self.init(unsafeResultMap: ["__typename": "User", "id": id, "email": email, "username": username])
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

      public var userDetail: UserDetail {
        get {
          return UserDetail(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }
    }
  }
}
