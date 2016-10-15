require "test_helper"

class ProyectosControllerTest < ActionController::TestCase
  def proyecto
    @proyecto ||= proyectos :one
  end

  def test_index
    get :index
    assert_response :success
    assert_not_nil assigns(:proyectos)
  end

  def test_new
    get :new
    assert_response :success
  end

  def test_create
    assert_difference("Proyecto.count") do
      post :create, proyecto: { calle: proyecto.calle, descripcion: proyecto.descripcion, dpto: proyecto.dpto, email: proyecto.email, nombre: proyecto.nombre, nroDomicilio: proyecto.nroDomicilio, pagWeb: proyecto.pagWeb, piso: proyecto.piso, telefono: proyecto.telefono }
    end

    assert_redirected_to proyecto_path(assigns(:proyecto))
  end

  def test_show
    get :show, id: proyecto
    assert_response :success
  end

  def test_edit
    get :edit, id: proyecto
    assert_response :success
  end

  def test_update
    put :update, id: proyecto, proyecto: { calle: proyecto.calle, descripcion: proyecto.descripcion, dpto: proyecto.dpto, email: proyecto.email, nombre: proyecto.nombre, nroDomicilio: proyecto.nroDomicilio, pagWeb: proyecto.pagWeb, piso: proyecto.piso, telefono: proyecto.telefono }
    assert_redirected_to proyecto_path(assigns(:proyecto))
  end

  def test_destroy
    assert_difference("Proyecto.count", -1) do
      delete :destroy, id: proyecto
    end

    assert_redirected_to proyectos_path
  end
end
