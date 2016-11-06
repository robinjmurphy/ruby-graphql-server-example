module Types
  Episode = GraphQL::ObjectType.define do
    name "Episode"
    description "An episode"
    field :id, !types.ID
    field :title, !types.String
    field :number, !types.Int
    field :show, !Types::Show
    field :season, !Types::Season
  end
end
