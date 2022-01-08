module Api
  module V1
    class Thread < ApplicationRecord
      validates :name, presence: true
      validates :description, presence: true
    end
  end
end
