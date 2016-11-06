SortDirectionType = GraphQL::EnumType.define do
  name "SortDirection"
  value("ASC", "Ascending", value: 'asc')
  value("DESC", "Descending", value: 'desc')
end
