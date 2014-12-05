module ClassyCrass
  class Property
    attr_reader :raw
    SIG_TOKENS = [:ident, :dimension, :hash]

    def initialize(raw)
      @raw = raw
    end

    def name
      raw[:name]
    end

    def value
      raw[:value]
    end

    def sig_tokens
      @sig_tokens ||= find_sig_tokens
    end

    def find_sig_tokens
      tokes = raw[:tokens].reject { |t| !SIG_TOKENS.include?(t[:node]) }
      tokes.map { |t| t.delete(:pos); t.delete(:raw) }
      tokes
    end

    def ==(property)
      return false unless property.is_a?(self.class)
      sig_tokens == property.sig_tokens
    end

    def !=(property)
      !(self == property)
    end
  end
end
