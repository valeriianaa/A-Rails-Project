require "test_helper"

class RolesControllerTest < ActionController::TestCase
  def rol
    @rol ||= roles :one
  end

  def test_index
    get :index
    assert_response :success
    assert_not_nil assigns(:roles)
  end

  def test_new
    get :new
    assert_response :success
  end

  def test_create
    assert_difference("Rol.count") do
      post :create, rol: { nombre: rol.nombre }
    end

    assert_redirected_to rol_path(assigns(:rol))
  end

  def test_show
    get :show, id: rol
    assert_response :success
  end

  def test_edit
    get :edit, id: rol
    assert_response :success
  end

  def test_update
    put :update, id: rol, rol: { nombre: rol.nombre }
    assert_redirected_to rol_path(assigns(:rol))
  end

  def test_destroy
    assert_difference("Rol.count", -1) do
      delete :destroy, id: rol
    end

    assert_redirected_to roles_path
  end
end
