require File.expand_path('../../test_helper', __FILE__)

class RisksControllerTest < ActionController::TestCase
  fixtures :projects, :risks

  def setup
    @project = projects(:projects_001)
    @risk    = risks(:risks_001)
  end

  test 'should get index' do
    @project.risks << @risk

    get :index, { project_id: @project }
    assert_template :index
    assert_not_nil assigns(:risks)
    assert_select 'table.risks' do
      assert_select 'td.title', @risk.title
    end
  end

  test 'should get new' do
    get :new, { project_id: @project }
    assert_template :new
    assert_not_nil assigns(:risk)
  end

  test 'should get edit' do
    get :edit, { project_id: @project, id: @risk }
    assert_template :edit
    assert_not_nil assigns(:risk)
    assert_equal @risk, assigns(:risk)
    assert_select 'input#risk_title[value=?]', @risk.title
  end

  test 'should get show' do
    get :show, { project_id: @project, id: @risk }
    assert_template :show
    assert_not_nil assigns(:risk)
    assert_equal @risk, assigns(:risk)
    assert_select 'h3', text: @risk.title
  end

  test 'should post create' do
    assert_difference 'Risk.count' do
      post :create, {
        project_id: @project,
        risk: { title: 'Risk testing', description: 'Risk testing description', probability: 2, impact: 4 }
      }
    end
    assert_redirected_to [@project, Risk.last]
  end

  test 'should put update' do
    put :update, {
      project_id: @project, id: @risk,
      risk: { title: 'Risk testing updated', description: 'Risk testing description updated', probability: 3, impact: 2 }
    }
    assert_redirected_to [@project, @risk]
  end

  test 'should destroy' do
    assert_difference 'Risk.count', -1 do
      delete :destroy, { project_id: @project, id: @risk }
      assert_redirected_to project_risks_path(@project)
    end
  end
end