SeasonType = GraphQL::ObjectType.define do
  name "Season"
  description "A season"
  field :id, !types.ID
  field :title, !types.String
  field :number, !types.Int
  field :show, ShowType
  field :episodes, !types[EpisodeType] do
    argument :sortDirection, SortDirectionType
    argument :limit, types.Int
    resolve ->(obj, args, ctx) {
      obj.episodes({
        :sort_direction => args['sortDirection'] || 'asc',
        :limit => args['limit']
      })
    }
  end
end
