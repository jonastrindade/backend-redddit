require 'rails_helper'

describe "Api::V1::PostsController", :type => :request do
  let!(:post) { FactoryBot.create(:post) }
  
  it 'delete a Post' do
    delete "/api/v1/posts/#{post.id}"
    expect(response).to have_http_status(:no_content)
  end
  
  # it "cant delete a Post, id doesn't exists" do
  #   expect(delete "/api/v1/posts/100000").to raise_exception
  # end
end
