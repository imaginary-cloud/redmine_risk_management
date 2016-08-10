class RiskStatus < ActiveRecord::Base
  unloadable

  include Redmine::SafeAttributes

  STATUS_TYPE = ['open', 'closed']

  acts_as_list :scope => 'status_type = \'#{status_type}\''

  has_many :risks

  validates :name, presence: true, uniqueness: true

  safe_attributes 'name', 'color', 'status_type', 'is_default', 'position'

  scope :ordered, -> { order('status_type DESC, position') }

  before_destroy :check_integrity
  after_save :update_default

  def color_name
    return "#" + "%06x" % self.color unless self.color.nil?
  end

  def color_name=(clr)
    self.color = clr.from(1).hex
  end

  def self.default
    where(is_default: true).first
  end


private

  def check_integrity
    raise "Can't delete risk status" if Risk.where(risk_status_id: self.id).any?
  end

  def update_default
    RiskStatus.where('id <> ?', id).update_all({ is_default: false }) if self.is_default?
  end
end
