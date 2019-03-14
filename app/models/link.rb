# frozen_string_literal: true

class Link < ApplicationRecord

  validates_presence_of :original
  validates :original, format: { with: URI::DEFAULT_PARSER.make_regexp, message: 'should be a valid link' }
end
