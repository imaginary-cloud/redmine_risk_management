require File.expand_path('../../test_helper', __FILE__)

class RiskStatusTest < ActiveSupport::TestCase
  fixtures :risk_statuses

  setup do
    @risk_status = risk_statuses(:risk_statuses_001)
  end

  test 'should be created' do
    risk_status = RiskStatus.new(name: 'Risk name', color: '#FFF', status_type: 'open')
    assert risk_status.save
  end

  test 'should validate name presence' do
    risk_status = RiskStatus.new
    assert risk_status.invalid?
    assert_equal [:name], risk_status.errors.keys.sort
  end

  test 'should validate name uniqueness' do
    @risk_status.update_attribute(:name, 'Risk 1')
    risk_status = RiskStatus.new(name: 'Risk 1')
    assert risk_status.invalid?
    assert_equal [:name], risk_status.errors.keys.sort
  end

end
