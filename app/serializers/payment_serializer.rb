class PaymentSerializer < ActiveModel::Serializer
  attributes :id, :card_name, :card_number,:card_id, :card_bank,:amount, :status, :receiver_email,:user_id
  belongs_to :card
end
