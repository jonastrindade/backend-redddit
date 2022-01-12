require 'rails_helper'

describe "Api::V1::CommentsController", :type => :request do
  let!(:comment) { FactoryBot.create(:comment) }
  
  it 'delete a Comment' do
    delete "/api/v1/comments/#{comment.id}"
    expect(response).to have_http_status(:no_content)
  end
  
  # it "cant delete a Comment, id doesn't exists" do
  #   expect(delete "/api/v1/comments/100000").to raise_exception
  # end
end
