require 'rails_helper'

describe "Api::V1::PostsController", :type => :request do
  
  it "creates a Post" do
    post "/api/v1/posts", params: { post: { title: "E-Sports", description: "Esports (also known as electronic sports, e-sports, or eSports) is a form of competition using video games.", thread_id: FactoryBot.create(:thread).id } }

    expect(JSON.parse(response.body)["title"]).to eq("E-Sports")
    expect(JSON.parse(response.body)["description"]).to eq("Esports (also known as electronic sports, e-sports, or eSports) is a form of competition using video games.")
    expect(response).to have_http_status(:created)
  end

  it "unprocessable_entity missing param description" do
    post "/api/v1/posts", params: { post: { title: "E-Sports" } }

    expect(JSON.parse(response.body)).to eq({"description"=>["can't be blank"], "thread"=>["must exist"]})
    expect(response).to have_http_status(:unprocessable_entity)
  end

  it "unprocessable_entity missing param title" do
    post "/api/v1/posts", params: { post: { description: "Esports (also known as electronic sports, e-sports, or eSports) is a form of competition using video games." } }

    expect(JSON.parse(response.body)).to eq({"thread"=>["must exist"], "title"=>["can't be blank"]})
    expect(response).to have_http_status(:unprocessable_entity)
  end
end
