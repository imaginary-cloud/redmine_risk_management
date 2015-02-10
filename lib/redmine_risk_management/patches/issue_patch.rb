module RedmineRiskManagement
  module Patches

    module IssuePatch
      def self.included(base) # :nodoc:
        base.class_eval do
          unloadable # Send unloadable so it will not be unloaded in development
          belongs_to :risk

          safe_attributes 'risk_id'
        end
      end
    end

  end
end

unless Issue.included_modules.include?(RedmineRiskManagement::Patches::IssuePatch)
  Issue.send(:include, RedmineRiskManagement::Patches::IssuePatch)
end
