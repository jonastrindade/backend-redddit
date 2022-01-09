require 'rails_helper'

describe "Api::V1::ThreadsController", :type => :request do
  
  it "creates a Thread" do
    post "/api/v1/threads", params: { thread: { name: "E-Sports", description: "Esports (also known as electronic sports, e-sports, or eSports) is a form of competition using video games." } }

    expect(JSON.parse(response.body)["name"]).to eq("E-Sports")
    expect(JSON.parse(response.body)["description"]).to eq("Esports (also known as electronic sports, e-sports, or eSports) is a form of competition using video games.")
    expect(response).to have_http_status(:created)
  end

  it "unprocessable_entity missing param description" do
    post "/api/v1/threads", params: { thread: { name: "E-Sports" } }

    expect(JSON.parse(response.body)).to eq({"description"=>["can't be blank"]})
    expect(response).to have_http_status(:unprocessable_entity)
  end

  it "unprocessable_entity missing param name" do
    post "/api/v1/threads", params: { thread: { description: "Esports (also known as electronic sports, e-sports, or eSports) is a form of competition using video games." } }

    expect(JSON.parse(response.body)).to eq({"name"=>["can't be blank"]})
    expect(response).to have_http_status(:unprocessable_entity)
  end
end
