module RedmineRiskManagement
  module Hooks

    class ViewsIssuesHook < Redmine::Hook::ViewListener
      render_on :view_issues_form_details_bottom, partial: 'issues/risk_form'
      render_on :view_issues_show_details_bottom, partial: 'issues/risk'
    end

  end
end
