require "test_helper"

class ProvinciasControllerTest < ActionController::TestCase
  def provincia
    @provincia ||= provincias :one
  end

  def test_index
    get :index
    assert_response :success
    assert_not_nil assigns(:provincias)
  end

  def test_new
    get :new
    assert_response :success
  end

  def test_create
    assert_difference("Provincia.count") do
      post :create, provincia: { nombre: provincia.nombre }
    end

    assert_redirected_to provincia_path(assigns(:provincia))
  end

  def test_show
    get :show, id: provincia
    assert_response :success
  end

  def test_edit
    get :edit, id: provincia
    assert_response :success
  end

  def test_update
    put :update, id: provincia, provincia: { nombre: provincia.nombre }
    assert_redirected_to provincia_path(assigns(:provincia))
  end

  def test_destroy
    assert_difference("Provincia.count", -1) do
      delete :destroy, id: provincia
    end

    assert_redirected_to provincias_path
  end
end
