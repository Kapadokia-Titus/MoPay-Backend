class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :email, :phone, :gender
  has_many :cards
end
