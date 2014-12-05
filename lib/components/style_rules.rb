module ClassyCrass
  class StyleRules
    include Enumerable
    attr_reader :list

    def initialize(list)
      @list = list.map { |sr| ClassyCrass::Rule.new(sr) }
    end

    def each(&block)
      @list.each(&block)
    end

    def [](arg)
      @list[arg]
    end

    def selectors
      @selectors ||= list.map { |x| x.selector }
    end
  end
end
