require_relative 'test_helper'

class TestDocxUnzipper < Minitest::Test
  def setup
    @css1 = CCHelper.cced(1)
    @css2 = CCHelper.cced(2)
  end

  def test_single_property_comparison
    margin1 = @css1.style_rules[0].properties[1]
    margin2 = @css2.style_rules[0].properties[1]
    assert margin1 == margin2
    color1 = @css1.style_rules[0].properties[0]
    color2 = @css2.style_rules[0].properties[0]
    assert color1 != color2
    padding1 = @css1.style_rules[0].properties[2]
    padding2 = @css2.style_rules[0].properties[2]
    assert padding1 == padding2
  end

  def test_rule_comparison
    first_h2 = @css1.style_rules[2]
    second_h2 = @css2.style_rules[2]
    first_h1 = @css1.style_rules[0]
    assert first_h2 == second_h2
    assert first_h2 != first_h1
  end

  def test_can_measure_properties_in_common
    first_h1 = @css1.style_rules[0]
    second_h1 = @css2.style_rules[0]
    assert first_h1 != second_h1
    common = first_h1.common_properties(second_h1)
    assert !common.empty?
    assert common.any? { |p| p.name == 'margin' }
    assert common.any? { |p| p.name == 'padding' }
  end
end
