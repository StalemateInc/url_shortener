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
          @link = Link.find_or_initialize_by(link_params)
          @link.save! unless @link.persisted?
        rescue ActiveRecord::RecordInvalid
          @link = { success: false, errors: ['Link validation failed'] }
        end
        respond_to do |format|
          puts format
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
