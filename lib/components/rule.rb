module ClassyCrass
  class Rule
    attr_reader :raw

    def initialize(raw)
      @raw = raw
    end

    def selector
      raw[:selector][:value]
    end

    def children
      raw[:children]
    end

    def properties
      @properties ||= children
        .find_all { |p| p[:node] == :property }
        .map { |p| ClassyCrass::Property.new(p) }
        .sort_by(&:name)
    end

    def ==(rule)
      together = self.properties.zip(rule.properties)
      together.all? { |x,y| x == y }
    end

    def !=(rule)
      !(self == rule)
    end

    def common_properties(rule)
      together = self.properties.zip(rule.properties)
      together.collect { |x,y| x if x == y }.compact
    end
  end
end
