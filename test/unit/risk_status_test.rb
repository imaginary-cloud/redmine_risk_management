require File.expand_path('../../test_helper', __FILE__)

class RiskStatusTest < ActiveSupport::TestCase

  test 'should be created' do
    risk_status = RiskStatus.new(name: 'Risk name', color: '#FFF', status_type: 'open')
    assert risk_status.save
  end

  test 'should have the necessary presence validators' do
    risk_status = RiskStatus.new
    assert risk_status.invalid?
    assert_equal [:name], risk_status.errors.keys.sort
  end

end
