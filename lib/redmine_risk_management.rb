ActionDispatch::Reloader.to_prepare do
  require_dependency 'redmine_risk_management/patches/project_patch'
end