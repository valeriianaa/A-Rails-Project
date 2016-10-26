require "test_helper"

class ActividadesProyectosControllerTest < ActionController::TestCase
  def actividad_proyecto
    @actividad_proyecto ||= actividades_proyectos :one
  end

  def test_index
    get :index
    assert_response :success
    assert_not_nil assigns(:actividades_proyectos)
  end

  def test_new
    get :new
    assert_response :success
  end

  def test_create
    assert_difference("ActividadProyecto.count") do
      post :create, actividad_proyecto: { fechaFin: actividad_proyecto.fechaFin, fechaInicio: actividad_proyecto.fechaInicio }
    end

    assert_redirected_to actividad_proyecto_path(assigns(:actividad_proyecto))
  end

  def test_show
    get :show, id: actividad_proyecto
    assert_response :success
  end

  def test_edit
    get :edit, id: actividad_proyecto
    assert_response :success
  end

  def test_update
    put :update, id: actividad_proyecto, actividad_proyecto: { fechaFin: actividad_proyecto.fechaFin, fechaInicio: actividad_proyecto.fechaInicio }
    assert_redirected_to actividad_proyecto_path(assigns(:actividad_proyecto))
  end

  def test_destroy
    assert_difference("ActividadProyecto.count", -1) do
      delete :destroy, id: actividad_proyecto
    end

    assert_redirected_to actividades_proyectos_path
  end
end
