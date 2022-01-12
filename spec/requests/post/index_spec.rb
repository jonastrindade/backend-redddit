require 'rails_helper'

describe "Api::V1::PostsController", :type => :request do
  let!(:posts) { FactoryBot.create_list(:post, 20) }
  
  before { get '/api/v1/posts' }
  
  it 'returns all Posts' do
    expect(JSON.parse(response.body).size).to eq(0)
  end
  
  it 'returns status code 200' do
    expect(response).to have_http_status(:success)
  end
end
