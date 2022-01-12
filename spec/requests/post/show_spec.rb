require 'rails_helper'

describe "Api::V1::PostsController", :type => :request do
  let!(:post) { FactoryBot.create(:post) }
  
  before { get "/api/v1/posts/#{post.id}" }
  
  it 'return one Post' do
    expect(JSON.parse(response.body)["title"].class).to eq(String)
    expect(JSON.parse(response.body)["description"].class).to eq(String)
  end
  
  it 'returns status code 200' do
    expect(response).to have_http_status(:success)
  end
end
