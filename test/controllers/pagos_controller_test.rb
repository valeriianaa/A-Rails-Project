require "test_helper"

class PagosControllerTest < ActionController::TestCase
  def pago
    @pago ||= pagos :one
  end

  def test_index
    get :index
    assert_response :success
    assert_not_nil assigns(:pagos)
  end

  def test_new
    get :new
    assert_response :success
  end

  def test_create
    assert_difference("Pago.count") do
      post :create, pago: { fecha: pago.fecha, monto: pago.monto }
    end

    assert_redirected_to pago_path(assigns(:pago))
  end

  def test_show
    get :show, id: pago
    assert_response :success
  end

  def test_edit
    get :edit, id: pago
    assert_response :success
  end

  def test_update
    put :update, id: pago, pago: { fecha: pago.fecha, monto: pago.monto }
    assert_redirected_to pago_path(assigns(:pago))
  end

  def test_destroy
    assert_difference("Pago.count", -1) do
      delete :destroy, id: pago
    end

    assert_redirected_to pagos_path
  end
end
