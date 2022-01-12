FactoryBot.define do
  factory :comment, class: "Api::V1::Comment" do
    comment { Faker::Lorem.sentence(word_count: 50) }
    post_id { FactoryBot.create(:post).id }
  end
end
