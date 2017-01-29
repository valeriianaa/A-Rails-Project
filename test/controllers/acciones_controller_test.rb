require "test_helper"

class AccionesControllerTest < ActionController::TestCase
  def accion
    @accion ||= acciones :one
  end

  def test_index
    get :index
    assert_response :success
    assert_not_nil assigns(:acciones)
  end

  def test_new
    get :new
    assert_response :success
  end

  def test_create
    assert_difference("Accion.count") do
      post :create, accion: { key_name: accion.key_name, nombre: accion.nombre }
    end

    assert_redirected_to accion_path(assigns(:accion))
  end

  def test_show
    get :show, id: accion
    assert_response :success
  end

  def test_edit
    get :edit, id: accion
    assert_response :success
  end

  def test_update
    put :update, id: accion, accion: { key_name: accion.key_name, nombre: accion.nombre }
    assert_redirected_to accion_path(assigns(:accion))
  end

  def test_destroy
    assert_difference("Accion.count", -1) do
      delete :destroy, id: accion
    end

    assert_redirected_to acciones_path
  end
end
