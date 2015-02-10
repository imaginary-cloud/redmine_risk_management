module RedmineRiskManagement
  module Patches

    module ProjectPatch
      def self.included(base) # :nodoc:
        base.class_eval do
          unloadable # Send unloadable so it will not be unloaded in development
          has_many :risks, dependent: :destroy
        end
      end
    end

  end
end

unless Project.included_modules.include?(RedmineRiskManagement::Patches::ProjectPatch)
  Project.send(:include, RedmineRiskManagement::Patches::ProjectPatch)
end
