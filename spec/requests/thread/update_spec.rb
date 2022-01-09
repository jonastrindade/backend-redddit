require 'rails_helper'

describe "Api::V1::Threads", :type => :request do
  let!(:threads) { FactoryBot.create_list(:thread, 20) }
  
  before { get '/api/v1/threads' }
  
  it 'returns all threads' do
    expect(JSON.parse(response.body).size).to eq(20)
  end
  
  it 'returns status code 200' do
    expect(response).to have_http_status(:success)
  end
end
