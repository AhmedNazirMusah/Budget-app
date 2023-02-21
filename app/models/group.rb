class Group < ApplicationRecord
    belongs_to :user
    has_many :entities
    validates :name, :user, presence: true

    def amount_accumulated_amount
        total = 0
        entities.each do |e|
          total += e.amount
        end
        total
      end
end