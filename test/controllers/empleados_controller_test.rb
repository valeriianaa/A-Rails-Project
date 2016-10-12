require "test_helper"

class EmpleadosControllerTest < ActionController::TestCase
  def empleado
    @empleado ||= empleados :one
  end

  def test_index
    get :index
    assert_response :success
    assert_not_nil assigns(:empleados)
  end

  def test_new
    get :new
    assert_response :success
  end

  def test_create
    assert_difference("Empleado.count") do
      post :create, empleado: {  }
    end

    assert_redirected_to empleado_path(assigns(:empleado))
  end

  def test_show
    get :show, id: empleado
    assert_response :success
  end

  def test_edit
    get :edit, id: empleado
    assert_response :success
  end

  def test_update
    put :update, id: empleado, empleado: {  }
    assert_redirected_to empleado_path(assigns(:empleado))
  end

  def test_destroy
    assert_difference("Empleado.count", -1) do
      delete :destroy, id: empleado
    end

    assert_redirected_to empleados_path
  end
end
