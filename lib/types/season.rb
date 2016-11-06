module Types
  Season = GraphQL::ObjectType.define do
    name "Season"
    description "A season"
    field :id, !types.ID
    field :title, !types.String
    field :number, !types.Int
    field :show, Types::Show
    field :episodes, !types[Types::Episode] do
      argument :sortDirection, types.String
      argument :limit, types.Int
      resolve ->(obj, args, ctx) {
        obj.episodes({
          :sort_direction => args['sortDirection'] || 'asc',
          :limit => args['limit']
        })
      }
    end
  end
end
