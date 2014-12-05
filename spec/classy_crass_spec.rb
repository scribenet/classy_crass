require_relative 'spec_helper'

describe ClassyCrass::Document do
  let(:cc){ CCHelper.cced(1) }

  it "should know its basic types" do
    expect(cc.style_rules).to be_a_kind_of(ClassyCrass::StyleRules)
    expect(cc.whitespaces).to be_a_kind_of(Array)
    expect(cc.at_rules).to be_a_kind_of(Array)
    expect(cc.comments).to be_a_kind_of(Array)
    expect(cc.selectors).to be_a_kind_of(Array)
  end
end

describe ClassyCrass::StyleRules do
  let(:rules) { CCHelper.cced(1).style_rules }

  it "should have access to a list of its selectors" do
    expect(rules.selectors).to be_a_kind_of(Array)
  end
end

describe ClassyCrass::Rule do
  let(:rule) { CCHelper.cced(1).style_rules[0] }

  it "should know its name" do
    expect(rule.selector).to be_a_kind_of(String)
  end

  it "should know its children" do
    expect(rule.children).to be_a_kind_of(Array)
  end

  it "should know its properties" do
    expect(rule.properties).to be_a_kind_of(Array)
  end
end

describe ClassyCrass::Property do
  let(:property) { CCHelper.cced(1).style_rules[0].properties[0] }

  it "should know its name and value" do
    expect(property.name).to be_a_kind_of(String)
    expect(property.value).to be_a_kind_of(String)
  end
end
