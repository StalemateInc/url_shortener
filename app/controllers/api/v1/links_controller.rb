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
        begin
          @link = Link.find_or_create_by!(link_params)
        rescue ActiveRecord::RecordInvalid => e
          respond_to do |format|
            format.json { render json: { errors: ['Provided link is not valid, please use a valid one'] } }
          end
        end
        respond_to do |format|
          format.json { render json: @link }
        end
      end

      private

      def link_params
        params.permit(:original)
      end
    end
  end
end
