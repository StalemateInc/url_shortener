# frozen_string_literal: true

module Api
  module V1
    class LinksController < ApplicationController

      # for testing purposes, need to be fixed later
      skip_before_action :verify_authenticity_token

      # GET /api/v1/links
      def index; end

      # POST /api/v1/links
      def create
        result = CreateShortenedLink.call(original: link_params[:original])
        respond_to do |format|
          puts format
          format.json do
            render json: { link: result.link,
                           success: result.success?,
                           errors: result.errors }
          end
        end
      end

      private

      def link_params
        params.permit(:original)
      end
    end
  end
end
