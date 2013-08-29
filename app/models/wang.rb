class Wang < ActiveRecord::Base
  def self.factory
    new do |wang|
      wang.token = SecureRandom.hex 16
    end
  end

  def templates
    return [] unless read_attribute(:templates)
    JSON.parse(read_attribute(:templates))
  end

  def libraries
    read_attribute(:libraries) || []
  end

  def javascript
    read_attribute(:javascript) || "App = Ember.Application.create();"
  end

end
