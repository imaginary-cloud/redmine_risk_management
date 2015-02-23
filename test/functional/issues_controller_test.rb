require File.expand_path('../../test_helper', __FILE__)

class IssuesControllerTest < ActionController::TestCase
  fixtures :projects,
           :users,
           :roles,
           :members,
           :member_roles,
           :issues,
           :issue_statuses,
           :versions,
           :trackers,
           :projects_trackers,
           :issue_categories,
           :enabled_modules,
           :enumerations,
           :attachments,
           :workflows,
           :custom_fields,
           :custom_values,
           :custom_fields_projects,
           :custom_fields_trackers,
           :time_entries,
           :journals,
           :journal_details,
           :queries,
           :risks

  def setup
    @issue = issues(:issues_001)
    @risk  = risks(:risks_001)
    @risk.issues << @issue
  end

  test 'should display related risk' do
    get :show, { id: @issue }
    assert_template :show
    assert_select '.box.risk a', text: "#{I18n.t(:label_risk)} ##{@risk.id}:"
  end
end