require "test_helper"

class InteresesControllerTest < ActionController::TestCase
  def interes
    @interes ||= intereses :one
  end

  def test_index
    get :index
    assert_response :success
    assert_not_nil assigns(:intereses)
  end

  def test_new
    get :new
    assert_response :success
  end

  def test_create
    assert_difference("Interes.count") do
      post :create, interes: { descripcion: interes.descripcion, nombre: interes.nombre, porcentaje: interes.porcentaje }
    end

    assert_redirected_to interes_path(assigns(:interes))
  end

  def test_show
    get :show, id: interes
    assert_response :success
  end

  def test_edit
    get :edit, id: interes
    assert_response :success
  end

  def test_update
    put :update, id: interes, interes: { descripcion: interes.descripcion, nombre: interes.nombre, porcentaje: interes.porcentaje }
    assert_redirected_to interes_path(assigns(:interes))
  end

  def test_destroy
    assert_difference("Interes.count", -1) do
      delete :destroy, id: interes
    end

    assert_redirected_to intereses_path
  end
end
