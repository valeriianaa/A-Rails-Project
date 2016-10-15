require "test_helper"

class ActividadesControllerTest < ActionController::TestCase
  def actividad
    @actividad ||= actividades :one
  end

  def test_index
    get :index
    assert_response :success
    assert_not_nil assigns(:actividades)
  end

  def test_new
    get :new
    assert_response :success
  end

  def test_create
    assert_difference("Actividad.count") do
      post :create, actividad: { descripcion: actividad.descripcion, nombre: actividad.nombre, obligatorio: actividad.obligatorio }
    end

    assert_redirected_to actividad_path(assigns(:actividad))
  end

  def test_show
    get :show, id: actividad
    assert_response :success
  end

  def test_edit
    get :edit, id: actividad
    assert_response :success
  end

  def test_update
    put :update, id: actividad, actividad: { descripcion: actividad.descripcion, nombre: actividad.nombre, obligatorio: actividad.obligatorio }
    assert_redirected_to actividad_path(assigns(:actividad))
  end

  def test_destroy
    assert_difference("Actividad.count", -1) do
      delete :destroy, id: actividad
    end

    assert_redirected_to actividades_path
  end
end
