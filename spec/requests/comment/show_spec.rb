require 'rails_helper'

describe "Api::V1::CommentsController", :type => :request do
  let!(:comment) { FactoryBot.create(:comment) }
  
  before { get "/api/v1/comments/#{comment.id}" }
  
  it 'return one Comment' do
    expect(JSON.parse(response.body)["comment"].class).to eq(String)
  end
  
  it 'returns status code 200' do
    expect(response).to have_http_status(:success)
  end
end
