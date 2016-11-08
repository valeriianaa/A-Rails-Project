require "test_helper"

class PagosRealizadosControllerTest < ActionController::TestCase
  def pago_realizado
    @pago_realizado ||= pagos_realizados :one
  end

  def test_index
    get :index
    assert_response :success
    assert_not_nil assigns(:pagos_realizados)
  end

  def test_new
    get :new
    assert_response :success
  end

  def test_create
    assert_difference("PagoRealizado.count") do
      post :create, pago_realizado: { fecha: pago_realizado.fecha, monto: pago_realizado.monto }
    end

    assert_redirected_to pago_realizado_path(assigns(:pago_realizado))
  end

  def test_show
    get :show, id: pago_realizado
    assert_response :success
  end

  def test_edit
    get :edit, id: pago_realizado
    assert_response :success
  end

  def test_update
    put :update, id: pago_realizado, pago_realizado: { fecha: pago_realizado.fecha, monto: pago_realizado.monto }
    assert_redirected_to pago_realizado_path(assigns(:pago_realizado))
  end

  def test_destroy
    assert_difference("PagoRealizado.count", -1) do
      delete :destroy, id: pago_realizado
    end

    assert_redirected_to pagos_realizados_path
  end
end
