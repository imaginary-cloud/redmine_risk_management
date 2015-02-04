Redmine::Plugin.register :redmine_risk_management do
  name 'Redmine Risk Management plugin'
  author 'Imaginary Cloud (http://imaginarycloud.com)'
  description 'Risk management plugin for Redmine'
  version '0.1'
  url 'https://github.com/imaginary-cloud/redmine_risk_management'
  author_url 'mailto:info@imaginarycloud.com'

  project_module :risk_management do
    permission :view_risks, { risks: :index }, { public: true }
  end

  menu :project_menu, :risks, { controller: :risks, action: :index },
       caption: 'Risks', before: :settings, param: :project_id
end
