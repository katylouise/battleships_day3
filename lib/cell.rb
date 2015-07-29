require_relative 'water'

class Cell

  DEFAULT_CONTENT = Water.new

  attr_reader :content

  def initialize(options={})
    options = defaults.merge(options)
    @content = options[:content]
  end

  private

  def defaults
    {content: DEFAULT_CONTENT}
  end
end