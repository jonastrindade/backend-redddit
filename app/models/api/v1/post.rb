module Api
  module V1
    class Post < ApplicationRecord

      belongs_to :thread, class_name: "Api::V1::Thread", foreign_key: "thread_id"
      has_many :comments, class_name: "Api::V1::Comment", foreign_key: "post_id"
      
      validates :title, presence: true
      validates :description, presence: true
    end
  end
end
