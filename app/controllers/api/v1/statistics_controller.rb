module Api
  module V1
    class StatisticsController < ApplicationController
      def index
        visits_count = Link.left_joins(:visits).group(:original).count
        visits = []
        visits_count.each_pair do |link, count|
          visits.push({original: link, visits: count} )
        end
        respond_to do |format|
          format.json { render json: visits }
        end
      end
    end
  end
end
