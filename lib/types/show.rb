module Types
  Show = GraphQL::ObjectType.define do
    name "Show"
    description "A show"
    field :id, !types.ID
    field :title, !types.String
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
