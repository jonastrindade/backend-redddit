FactoryBot.define do
  factory :post, class: "Api::V1::Post" do
    title { Faker::Lorem.sentence(word_count: 3) }
    description { Faker::Lorem.sentence(word_count: 50) }
    thread_id { FactoryBot.create(:thread).id }
  end
end
