QueryType = GraphQL::ObjectType.define do
  name "Query"
  description "The query root of this schema"

  field :episode do
    type EpisodeType
    argument :id, !types.ID
    description "Find an Episode by its ID"
    resolve ->(obj, args, ctx) { Episode.find(id: args['id']) }
  end
end

Schema = GraphQL::Schema.define do
  query QueryType
end
