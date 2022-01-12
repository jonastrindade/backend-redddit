require 'rails_helper'

describe "Api::V1::CommentsController", :type => :request do
  
  it "creates a Comment" do
    post "/api/v1/comments", params: { comment: { comment: "Esports (also known as electronic sports, e-sports, or eSports) is a form of competition using video games.", post_id: FactoryBot.create(:post).id } }

    expect(JSON.parse(response.body)["comment"]).to eq("Esports (also known as electronic sports, e-sports, or eSports) is a form of competition using video games.")
    expect(response).to have_http_status(:created)
  end

  it "unprocessable_entity missing param post" do
    post "/api/v1/comments", params: { comment: { comment: "E-Sports" } }

    expect(JSON.parse(response.body)).to eq({"post"=>["must exist"]})
    expect(response).to have_http_status(:unprocessable_entity)
  end

end
