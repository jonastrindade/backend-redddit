module Api
  module V1
    class Thread < ApplicationRecord

      has_many :posts, class_name: "Api::V1::Post", foreign_key: "thread_id"

      validates :name, presence: true
      validates :description, presence: true
    end
  end
end
