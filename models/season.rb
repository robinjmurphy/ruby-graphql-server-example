class Season < Sequel::Model
  many_to_one :show
  one_to_many :episodes

  include Fields::Episodes
end
