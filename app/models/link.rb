class Link < ActiveRecord::Base
  attr_accessible :original, :short, :meowbify

  before_create :append_http
  before_create :shorten

  validates :original, :presence => true

  def meowbified_url
    "http://cat.%s.meowbify.com" % self.original[7..-1]
  end

  def to_param
    self.short
  end

  private
  def append_http
    self.original = "http://#{self.original}" unless self.original =~ /^http:\/\//
  end

  def shorten
    record = true

    while record
      chars = ('a'..'z').to_a + ('0'..'9').to_a
      self.short = (1..6).inject('') { |str, i| str << chars[rand(chars.length)] }
      record = Link.find_by_short(self.short)
    end
  end
end
