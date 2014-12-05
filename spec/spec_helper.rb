require 'simplecov'
require 'simplecov-html'
require "coveralls"
SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter[
    SimpleCov::Formatter::HTMLFormatter,
    Coveralls::SimpleCov::Formatter,
]

SimpleCov.start do
  add_filter 'test/'
end if ENV['COVERAGE']

require 'rspec'
require 'crass'
require 'classy_crass'

module CCHelper
  DIR = File.dirname(__FILE__)
  SAMPLES = File.join(DIR, 'samples')

  def self.sample(num)
    File.read(File.join(SAMPLES, "sample#{num}.css"))
  end

  def self.cced(num)
    ClassyCrass.parse(sample(num))
  end
end
