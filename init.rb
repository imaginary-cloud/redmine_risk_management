require 'redmine_risk_management'

Redmine::Plugin.register :redmine_risk_management do
  name 'Redmine Risk Management plugin'
  author 'Imaginary Cloud (http://imaginarycloud.com)'
  description 'Risk management plugin for Redmine'
  version '0.2'
  url 'https://github.com/imaginary-cloud/redmine_risk_management'
  author_url 'mailto:info@imaginarycloud.com'

  settings default: {
    status: ['Identified', 'Monitored', 'Occurred', 'Dismissed'],
    status_types: ['open', 'closed']
  }, partial: 'settings/risks'

  project_module :risks do
    permission :view_risks, { risks: [:index, :show] }, { public: true }
    permission :add_risks, { risks: [:new, :create] }, { public: true }
    permission :edit_risks, { risks: [:edit, :update] }, { public: true }
    permission :delete_risks, { risks: :destroy }, { public: true }
  end

  menu :project_menu, :risks, { controller: :risks, action: :index },
       caption: :label_risk_plural, before: :settings, param: :project_id
end
