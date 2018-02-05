class Rsvp
  include Mongoid::Document

  field :name, type: String
  field :email, type: String

  validates_presence_of :name
  validates_presence_of :email
end
