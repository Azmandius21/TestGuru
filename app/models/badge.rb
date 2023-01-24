class Badge < ApplicationRecord
  has_many :achievements, dependent: :destroy
  has_many :users, through: :achievements

  belongs_to :rule
end
