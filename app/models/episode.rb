class Episode < Sequel::Model
  many_to_one :show
  many_to_one :season
end
