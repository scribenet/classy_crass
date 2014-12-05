require 'crass'
require 'components'
require 'forwardable'

module ClassyCrass
  def self.parse(css, options = {})
    crass = Crass.parse(css, options)
    Document.new(crass)
  end

  class Document
    attr_reader :crass
    extend Forwardable

    def_delegator :style_rules, :selectors, :selectors

    def initialize(crass)
      @crass = crass
    end

    def style_rules
      @style_rules ||= ClassyCrass::StyleRules.new(crass_select(:style_rule))
    end

    def whitespaces
      @whitespace ||= crass_select(:whitespace)
    end

    def at_rules
      @at_rule ||= crass_select(:at_rule)
    end

    def comments
      @comments ||= crass_select(:comment)
    end

    def crass_select(type)
      crass.find_all { |i| i[:node] == type }
    end
  end
end
