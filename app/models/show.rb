class Show < Sequel::Model
  one_to_many :episodes
  one_to_many :seasons

  include Fields::Episodes
end
