//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

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

public final class GetAllPostQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition =
    """
    query getAllPost($first: Int, $commentFirst: String) {
      getAllPosts(first: $first, after: $commentFirst) {
        __typename
        edges {
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
        pageInfo {
          __typename
          hasNextPage
          endCursor
        }
      }
    }
    """

  public let operationName = "getAllPost"

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
          GraphQLField("author", type: .nonNull(.object(Author.selections))),
          GraphQLField("tags", type: .list(.nonNull(.object(Tag.selections)))),
          GraphQLField("topic", type: .nonNull(.object(Topic.selections))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("excerpt", type: .nonNull(.scalar(String.self))),
          GraphQLField("subject", type: .nonNull(.scalar(String.self))),
          GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
          GraphQLField("totalLikesCount", type: .nonNull(.scalar(Int.self))),
          GraphQLField("totalCommentsCount", type: .nonNull(.scalar(Int.self))),
          GraphQLField("postViewCount", type: .nonNull(.scalar(Int.self))),
          GraphQLField("status", type: .nonNull(.scalar(PostStatus.self))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(author: Author, tags: [Tag]? = nil, topic: Topic, id: GraphQLID, excerpt: String, subject: String, createdAt: String, totalLikesCount: Int, totalCommentsCount: Int, postViewCount: Int, status: PostStatus) {
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
        public var createdAt: String {
          get {
            return resultMap["createdAt"]! as! String
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
