class Museum
  attr_reader :name,
              :exhibits,
              :reccomend_exhibits

  def initialize(name)
    @name = name
    @exhibits = []
  end

  def add_exhibit(exhibit_name)
    exhibits << exhibit_name
  end

  def reccomend_exhibits(patron)
    reccomend_exhibits = []
    @exhibits.each do |exhibit|
      if patron.interests.include?(exhibit.name)
        reccomend_exhibits << exhibit
      end
    end
    reccomend_exhibits
  end
end