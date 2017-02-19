require "test_helper"

class SystemsettingsControllerTest < ActionController::TestCase
  def systemsetting
    @systemsetting ||= systemsettings :one
  end

  def test_index
    get :index
    assert_response :success
    assert_not_nil assigns(:systemsettings)
  end

  def test_new
    get :new
    assert_response :success
  end

  def test_create
    assert_difference("Systemsetting.count") do
      post :create, systemsetting: { tipo_pago_saldo_id: systemsetting.tipo_pago_saldo_id }
    end

    assert_redirected_to systemsetting_path(assigns(:systemsetting))
  end

  def test_show
    get :show, id: systemsetting
    assert_response :success
  end

  def test_edit
    get :edit, id: systemsetting
    assert_response :success
  end

  def test_update
    put :update, id: systemsetting, systemsetting: { tipo_pago_saldo_id: systemsetting.tipo_pago_saldo_id }
    assert_redirected_to systemsetting_path(assigns(:systemsetting))
  end

  def test_destroy
    assert_difference("Systemsetting.count", -1) do
      delete :destroy, id: systemsetting
    end

    assert_redirected_to systemsettings_path
  end
end
