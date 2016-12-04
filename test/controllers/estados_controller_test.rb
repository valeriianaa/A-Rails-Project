require "test_helper"

class EstadosControllerTest < ActionController::TestCase
  def estado
    @estado ||= estados :one
  end

  def test_index
    get :index
    assert_response :success
    assert_not_nil assigns(:estados)
  end

  def test_new
    get :new
    assert_response :success
  end

  def test_create
    assert_difference("Estado.count") do
      post :create, estado: { nombre: estado.nombre, ultimo: estado.ultimo }
    end

    assert_redirected_to estado_path(assigns(:estado))
  end

  def test_show
    get :show, id: estado
    assert_response :success
  end

  def test_edit
    get :edit, id: estado
    assert_response :success
  end

  def test_update
    put :update, id: estado, estado: { nombre: estado.nombre, ultimo: estado.ultimo }
    assert_redirected_to estado_path(assigns(:estado))
  end

  def test_destroy
    assert_difference("Estado.count", -1) do
      delete :destroy, id: estado
    end

    assert_redirected_to estados_path
  end
end
