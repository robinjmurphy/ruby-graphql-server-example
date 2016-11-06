class Show < Sequel::Model
  one_to_many :episodes

  include Fields::Episodes
end
