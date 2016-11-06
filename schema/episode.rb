EpisodeType = GraphQL::ObjectType.define do
  name "Episode"
  description "An episode"
  field :id, !types.ID
  field :title, !types.String
  field :number, !types.Int
  field :show, !ShowType
  field :season, !SeasonType
end
