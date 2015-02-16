require File.expand_path('../../test_helper', __FILE__)

class RiskTest < ActiveSupport::TestCase
  fixtures :projects, :risks, :users

  setup do
    @risk = risks(:risks_001)
  end

  test "should have the necessary presence validators" do
    risk = Risk.new
    assert risk.invalid?
    attributes = [:title, :description, :probability, :impact].sort
    assert_equal attributes, risk.errors.keys.sort
  end

  test 'should have numeric probability and impact between 1 and 4' do
    @risk.probability = 0
    @risk.impact = 5
    assert @risk.invalid?

    @risk.probability = 1
    @risk.impact = 3
    assert @risk.valid?
  end

  test 'should have rationale value in default list' do
    @risk.rationale = 'Mitigation'
    assert @risk.invalid?

    @risk.rationale = Risk::RATIONALES.sample
    assert @risk.valid?
  end

  test 'should calculate criticality as the product of probability and impact' do
    @risk.probability = 2
    @risk.impact = 4
    @risk.save
    assert_equal 8, @risk.criticality
  end

  test 'should be created' do
    risk = Risk.new(title: 'Risk title', description: 'Description for Risk',
                    probability: 2, impact: 4, criticality: 4, rationale: 'Monitor')
    assert risk.save
  end

end
