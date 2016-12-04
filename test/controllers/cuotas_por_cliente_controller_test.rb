require "test_helper"

class CuotasPorClienteControllerTest < ActionController::TestCase
  def cuota_por_cliente
    @cuota_por_cliente ||= cuotas_por_cliente :one
  end

  def test_index
    get :index
    assert_response :success
    assert_not_nil assigns(:cuotas_por_cliente)
  end

  def test_new
    get :new
    assert_response :success
  end

  def test_create
    assert_difference("CuotaPorCliente.count") do
      post :create, cuota_por_cliente: { descuento: cuota_por_cliente.descuento, interes: cuota_por_cliente.interes, montoTotal: cuota_por_cliente.montoTotal }
    end

    assert_redirected_to cuota_por_cliente_path(assigns(:cuota_por_cliente))
  end

  def test_show
    get :show, id: cuota_por_cliente
    assert_response :success
  end

  def test_edit
    get :edit, id: cuota_por_cliente
    assert_response :success
  end

  def test_update
    put :update, id: cuota_por_cliente, cuota_por_cliente: { descuento: cuota_por_cliente.descuento, interes: cuota_por_cliente.interes, montoTotal: cuota_por_cliente.montoTotal }
    assert_redirected_to cuota_por_cliente_path(assigns(:cuota_por_cliente))
  end

  def test_destroy
    assert_difference("CuotaPorCliente.count", -1) do
      delete :destroy, id: cuota_por_cliente
    end

    assert_redirected_to cuotas_por_cliente_path
  end
end
