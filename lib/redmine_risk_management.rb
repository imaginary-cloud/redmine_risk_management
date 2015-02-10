ActionDispatch::Reloader.to_prepare do
  require_dependency 'redmine_risk_management/hooks/views_issues_hook'
  require_dependency 'redmine_risk_management/patches/issue_patch'
  require_dependency 'redmine_risk_management/patches/project_patch'
end