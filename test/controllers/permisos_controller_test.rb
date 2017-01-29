require "test_helper"

class PermisosControllerTest < ActionController::TestCase
  def permiso
    @permiso ||= permisos :one
  end

  def test_index
    get :index
    assert_response :success
    assert_not_nil assigns(:permisos)
  end

  def test_new
    get :new
    assert_response :success
  end

  def test_create
    assert_difference("Permiso.count") do
      post :create, permiso: {  }
    end

    assert_redirected_to permiso_path(assigns(:permiso))
  end

  def test_show
    get :show, id: permiso
    assert_response :success
  end

  def test_edit
    get :edit, id: permiso
    assert_response :success
  end

  def test_update
    put :update, id: permiso, permiso: {  }
    assert_redirected_to permiso_path(assigns(:permiso))
  end

  def test_destroy
    assert_difference("Permiso.count", -1) do
      delete :destroy, id: permiso
    end

    assert_redirected_to permisos_path
  end
end
