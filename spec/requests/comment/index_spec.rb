require 'rails_helper'

describe "Api::V1::CommentsController", :type => :request do
  let!(:comments) { FactoryBot.create_list(:comment, 20) }
  
  before { get '/api/v1/comments' }
  
  it 'returns all Comments' do
    expect(JSON.parse(response.body).size).to eq(0)
  end
  
  it 'returns status code 200' do
    expect(response).to have_http_status(:success)
  end
end
