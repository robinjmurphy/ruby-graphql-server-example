require 'graphql'

EpisodeType = GraphQL::ObjectType.define do
  name "Episode"
  description "An Episode"
  field :id, !types.ID
  field :title, !types.String
  field :number, !types.Int
end
