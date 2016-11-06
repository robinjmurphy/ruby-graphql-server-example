QueryType = GraphQL::ObjectType.define do
  name "Query"
  description "The query root of this schema"

  field :episode do
    type Types::Episode
    argument :id, !types.ID
    description "Find an episode by its ID"
    resolve ->(obj, args, ctx) { Episode.find(id: args['id']) }
  end

  field :season do
    type Types::Season
    argument :id, !types.ID
    description "Find a season by its ID"
    resolve ->(obj, args, ctx) { Season.find(id: args['id']) }
  end

  field :show do
    type Types::Show
    argument :id, !types.ID
    description "Find a show by its ID"
    resolve ->(obj, args, ctx) { Show.find(id: args['id']) }
  end

  field :shows do
    type types[Types::Show]
    description "List all shows"
    resolve ->(obj, args, ctx) { Show.all }
  end
end

Schema = GraphQL::Schema.define do
  query QueryType
end
