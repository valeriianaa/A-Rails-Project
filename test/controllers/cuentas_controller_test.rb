require "test_helper"

class CuentasControllerTest < ActionController::TestCase
  def cuenta
    @cuenta ||= cuentas :one
  end

  def test_index
    get :index
    assert_response :success
    assert_not_nil assigns(:cuentas)
  end

  def test_new
    get :new
    assert_response :success
  end

  def test_create
    assert_difference("Cuenta.count") do
      post :create, cuenta: { saldo: cuenta.saldo }
    end

    assert_redirected_to cuenta_path(assigns(:cuenta))
  end

  def test_show
    get :show, id: cuenta
    assert_response :success
  end

  def test_edit
    get :edit, id: cuenta
    assert_response :success
  end

  def test_update
    put :update, id: cuenta, cuenta: { saldo: cuenta.saldo }
    assert_redirected_to cuenta_path(assigns(:cuenta))
  end

  def test_destroy
    assert_difference("Cuenta.count", -1) do
      delete :destroy, id: cuenta
    end

    assert_redirected_to cuentas_path
  end
end
