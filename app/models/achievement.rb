class Achievement < ApplicationRecord
  has_one :badge
  has_one :user

  # Эта модель создает иснстансы для каждого награждения
end
