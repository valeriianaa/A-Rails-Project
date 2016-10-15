require "test_helper"

class CiudadesControllerTest < ActionController::TestCase
  def ciudad
    @ciudad ||= ciudades :one
  end

  def test_index
    get :index
    assert_response :success
    assert_not_nil assigns(:ciudades)
  end

  def test_new
    get :new
    assert_response :success
  end

  def test_create
    assert_difference("Ciudad.count") do
      post :create, ciudad: { nombre: ciudad.nombre }
    end

    assert_redirected_to ciudad_path(assigns(:ciudad))
  end

  def test_show
    get :show, id: ciudad
    assert_response :success
  end

  def test_edit
    get :edit, id: ciudad
    assert_response :success
  end

  def test_update
    put :update, id: ciudad, ciudad: { nombre: ciudad.nombre }
    assert_redirected_to ciudad_path(assigns(:ciudad))
  end

  def test_destroy
    assert_difference("Ciudad.count", -1) do
      delete :destroy, id: ciudad
    end

    assert_redirected_to ciudades_path
  end
end
