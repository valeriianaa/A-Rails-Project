require "test_helper"

class DepartamentosControllerTest < ActionController::TestCase
  def departamento
    @departamento ||= departamentos :one
  end

  def test_index
    get :index
    assert_response :success
    assert_not_nil assigns(:departamentos)
  end

  def test_new
    get :new
    assert_response :success
  end

  def test_create
    assert_difference("Departamento.count") do
      post :create, departamento: { nombre: departamento.nombre }
    end

    assert_redirected_to departamento_path(assigns(:departamento))
  end

  def test_show
    get :show, id: departamento
    assert_response :success
  end

  def test_edit
    get :edit, id: departamento
    assert_response :success
  end

  def test_update
    put :update, id: departamento, departamento: { nombre: departamento.nombre }
    assert_redirected_to departamento_path(assigns(:departamento))
  end

  def test_destroy
    assert_difference("Departamento.count", -1) do
      delete :destroy, id: departamento
    end

    assert_redirected_to departamentos_path
  end
end
