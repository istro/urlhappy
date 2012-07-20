class Link < ActiveRecord::Base
  attr_accessible :original, :short, :meowbify

  def verify
    given = self.original
    normalized = given[0,7] == 'http://' ? given : 'http://'+given
    self.original = normalized
  end

  def meowbify
    bare = self.original[7, self.original.length]
    meowbified = 'http://cat.' + bare + '.meowbify.com'
    self.meowbify = meowbified
  end

  def shorten


  end

end
