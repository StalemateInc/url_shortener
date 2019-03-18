module Api
  module V1
    class StatisticsController < ApplicationController
      include Pagy::Backend

      def index
        all_visits = sorted_statistics(Link.left_joins(:visits).group(:original).count, params[:field], params[:type])
        pagy, visits_p = pagy_array(all_visits, items: params[:perPage], page: params[:page])
        visits = []
        visits_p.each do |link, count|
          visits.push({original: link, visits: count} )
        end
        respond_to do |format|
          format.json { render json: {data: visits, totalRecords: all_visits.length } }
        end
      end

      private

      def sorted_statistics(hash, field, order)
        sorted = hash.sort_by { |k,v| field == 'visits' ? v : k }
        order == 'asc' ? sorted : sorted.reverse
      end

    end
  end
end
