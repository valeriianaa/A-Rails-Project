require "test_helper"

class TiposDePagoControllerTest < ActionController::TestCase
  def tipo_de_pago
    @tipo_de_pago ||= tipos_de_pago :one
  end

  def test_index
    get :index
    assert_response :success
    assert_not_nil assigns(:tipos_de_pago)
  end

  def test_new
    get :new
    assert_response :success
  end

  def test_create
    assert_difference("TipoDePago.count") do
      post :create, tipo_de_pago: { nombre: tipo_de_pago.nombre }
    end

    assert_redirected_to tipo_de_pago_path(assigns(:tipo_de_pago))
  end

  def test_show
    get :show, id: tipo_de_pago
    assert_response :success
  end

  def test_edit
    get :edit, id: tipo_de_pago
    assert_response :success
  end

  def test_update
    put :update, id: tipo_de_pago, tipo_de_pago: { nombre: tipo_de_pago.nombre }
    assert_redirected_to tipo_de_pago_path(assigns(:tipo_de_pago))
  end

  def test_destroy
    assert_difference("TipoDePago.count", -1) do
      delete :destroy, id: tipo_de_pago
    end

    assert_redirected_to tipos_de_pago_path
  end
end
