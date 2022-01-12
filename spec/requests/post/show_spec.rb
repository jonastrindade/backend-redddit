require 'rails_helper'

describe "Api::V1::ThreadsController", :type => :request do
  let!(:thread) { FactoryBot.create(:thread) }
  
  before { get "/api/v1/threads/#{thread.id}" }
  
  it 'return one Thread' do
    expect(JSON.parse(response.body)["id"].class).to eq(Integer)
    expect(JSON.parse(response.body)["name"].class).to eq(String)
    expect(JSON.parse(response.body)["description"].class).to eq(String)
  end
  
  it 'returns status code 200' do
    expect(response).to have_http_status(:success)
  end
end
