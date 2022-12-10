class Payment < ApplicationRecord
    belongs_to :card
    validates :card_name, presence: true
    validates :card_number, presence: true
    validates :card_bank, presence: true
    validates :receiver_email, presence: true
    validates :user_id, presence: true
    validates :card_id, presence: true
    validates :amount, presence: true
end
