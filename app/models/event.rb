class Event < ApplicationRecord
  has_many :event_users, dependent: :destroy
  has_many :users, through: :event_users

  scope :name_search, -> (search_term) { where("name iLIKE ?", "%#{search_term}%")}
  scope :city_search, -> (search_term) { where("city iLIKE ?", "%#{search_term}%")}
  scope :state_search, -> (search_term) { where("state iLIKE ?", "%#{search_term}%")}
end
