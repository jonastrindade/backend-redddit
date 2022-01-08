module Api
  module V1
    class StatusController < ApplicationController

      def index
        render json: { status: 200, ruby_v: '3.0.2', rails_v: '6.1.4.1'}
      end

    end
  end
end