# frozen_string_literal: true

class Link < ApplicationRecord

  has_many :visits

  validates_presence_of :original
  validates :original, format: { with: URI::DEFAULT_PARSER.make_regexp, message: 'must be a valid link' }
end
