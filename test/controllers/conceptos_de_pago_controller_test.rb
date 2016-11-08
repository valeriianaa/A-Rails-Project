require "test_helper"

class ConceptosDePagoControllerTest < ActionController::TestCase
  def concepto_de_pago
    @concepto_de_pago ||= conceptos_de_pago :one
  end

  def test_index
    get :index
    assert_response :success
    assert_not_nil assigns(:conceptos_de_pago)
  end

  def test_new
    get :new
    assert_response :success
  end

  def test_create
    assert_difference("ConceptoDePago.count") do
      post :create, concepto_de_pago: { descripcion: concepto_de_pago.descripcion, fechaVencimiento: concepto_de_pago.fechaVencimiento, monto: concepto_de_pago.monto, nombre: concepto_de_pago.nombre, plazoRecordatorio: concepto_de_pago.plazoRecordatorio }
    end

    assert_redirected_to concepto_de_pago_path(assigns(:concepto_de_pago))
  end

  def test_show
    get :show, id: concepto_de_pago
    assert_response :success
  end

  def test_edit
    get :edit, id: concepto_de_pago
    assert_response :success
  end

  def test_update
    put :update, id: concepto_de_pago, concepto_de_pago: { descripcion: concepto_de_pago.descripcion, fechaVencimiento: concepto_de_pago.fechaVencimiento, monto: concepto_de_pago.monto, nombre: concepto_de_pago.nombre, plazoRecordatorio: concepto_de_pago.plazoRecordatorio }
    assert_redirected_to concepto_de_pago_path(assigns(:concepto_de_pago))
  end

  def test_destroy
    assert_difference("ConceptoDePago.count", -1) do
      delete :destroy, id: concepto_de_pago
    end

    assert_redirected_to conceptos_de_pago_path
  end
end
