module Api
  module V1
    class Post < ApplicationRecord

      belongs_to :thread, class_name: "Api::V1::Thread", foreign_key: "thread_id"
      
      validates :title, presence: true
      validates :description, presence: true
    end
  end
end
