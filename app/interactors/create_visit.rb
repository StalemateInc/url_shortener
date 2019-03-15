class CreateVisit < BaseInteractor

  # country: Integer, shortened: String

  def call
    link = Link.find_by(shortened: context.shortened)
    if link
      Visit.create(link: link, ip: context.request.remote_ip, country: context.country)
      context.link = link.original
    else
      context.fail!
    end
  end
end