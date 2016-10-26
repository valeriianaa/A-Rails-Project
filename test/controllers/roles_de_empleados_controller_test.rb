require "test_helper"

class RolesDeEmpleadosControllerTest < ActionController::TestCase
  def rol_de_empleado
    @rol_de_empleado ||= roles_de_empleados :one
  end

  def test_index
    get :index
    assert_response :success
    assert_not_nil assigns(:roles_de_empleados)
  end

  def test_new
    get :new
    assert_response :success
  end

  def test_create
    assert_difference("RolDeEmpleado.count") do
      post :create, rol_de_empleado: { nombre: rol_de_empleado.nombre }
    end

    assert_redirected_to rol_de_empleado_path(assigns(:rol_de_empleado))
  end

  def test_show
    get :show, id: rol_de_empleado
    assert_response :success
  end

  def test_edit
    get :edit, id: rol_de_empleado
    assert_response :success
  end

  def test_update
    put :update, id: rol_de_empleado, rol_de_empleado: { nombre: rol_de_empleado.nombre }
    assert_redirected_to rol_de_empleado_path(assigns(:rol_de_empleado))
  end

  def test_destroy
    assert_difference("RolDeEmpleado.count", -1) do
      delete :destroy, id: rol_de_empleado
    end

    assert_redirected_to roles_de_empleados_path
  end
end
