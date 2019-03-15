class CreateShortenedLink < BaseInteractor

  # original: String

  def call
    context.errors = []
    link = Link.find_by(original: context.original)
    unless link
      if link_valid?(context.original)
        # create shortened there
        link = Link.create(original: context.original, shortened: ':)')
      else
        context.errors.push('Provided record is not valid')
        context.fail!
      end
    end
    context.link = link
  end

  private

  def link_valid?(link)
    link =~ URI::DEFAULT_PARSER.make_regexp
  end
end