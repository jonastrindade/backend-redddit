require 'rails_helper'

describe "Api::V1::CommentsController", :type => :request do
  let!(:comment) { FactoryBot.create(:comment) }
  
  it 'delete a Comment' do
    delete "/api/v1/comments/#{comment.id}"
    expect(response).to have_http_status(:no_content)
  end
  
end
