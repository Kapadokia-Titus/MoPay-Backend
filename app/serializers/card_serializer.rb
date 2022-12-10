class CardSerializer < ActiveModel::Serializer
  attributes :id, :card_name, :card_number, :user_id, :expiration, :card_bank, :cvv, :amount
  belongs_to :user
  has_many :payments
end
