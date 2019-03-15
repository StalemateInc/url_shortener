class RedirectController < ApplicationController

  def index
    link = Link.find_by(shortened: params[:path])
    if link
      redirect_to link.original
    else
      render file: "#{Rails.root}/public/404.html", layout: false, status: :not_found
    end
  end
end