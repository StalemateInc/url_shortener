# frozen_string_literal: true

class RedirectController < ApplicationController

  def index
    result = MemorizeVisit.call(request: request, shortened: params[:path])
    if result.success?
      redirect_to result.link
    else
      render file: "#{Rails.root}/public/404.html", layout: false, status: :not_found
    end
  end
end