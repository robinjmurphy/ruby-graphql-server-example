ShowType = GraphQL::ObjectType.define do
  name "Show"
  description "An Show"
  field :id, !types.ID
  field :title, !types.String
end
