require "test_helper"

class ContratosControllerTest < ActionController::TestCase
  def contrato
    @contrato ||= contratos :one
  end

  def test_index
    get :index
    assert_response :success
    assert_not_nil assigns(:contratos)
  end

  def test_new
    get :new
    assert_response :success
  end

  def test_create
    assert_difference("Contrato.count") do
      post :create, contrato: { fechaFin: contrato.fechaFin, fechaInicio: contrato.fechaInicio }
    end

    assert_redirected_to contrato_path(assigns(:contrato))
  end

  def test_show
    get :show, id: contrato
    assert_response :success
  end

  def test_edit
    get :edit, id: contrato
    assert_response :success
  end

  def test_update
    put :update, id: contrato, contrato: { fechaFin: contrato.fechaFin, fechaInicio: contrato.fechaInicio }
    assert_redirected_to contrato_path(assigns(:contrato))
  end

  def test_destroy
    assert_difference("Contrato.count", -1) do
      delete :destroy, id: contrato
    end

    assert_redirected_to contratos_path
  end
end
