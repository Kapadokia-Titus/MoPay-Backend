class Card < ApplicationRecord
    belongs_to :user
    validates :card_name, presence: true
    validates :card_number, presence: true
    validates :expiration, presence: true
    validates :card_bank, presence: true
    validates :cvv, presence: true
    validates :user_id, presence: true
    validates :amount, presence: true

end
