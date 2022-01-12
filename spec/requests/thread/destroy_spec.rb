require 'rails_helper'

describe "Api::V1::ThreadsController", :type => :request do
  let!(:thread) { FactoryBot.create(:thread) }
  
  it 'delete a Thread' do
    delete "/api/v1/threads/#{thread.id}"
    expect(response).to have_http_status(:no_content)
  end
  
  # it "cant delete a Thread, id doesn't exists" do
  #   expect(delete "/api/v1/threads/100000").to raise_exception
  # end
end
