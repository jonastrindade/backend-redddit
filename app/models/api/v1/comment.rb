module Api
  module V1
    class Comment < ApplicationRecord

      belongs_to :post, class_name: "Api::V1::Post", foreign_key: "post_id"
      
      validates :comment, presence: true
    end
  end
end
