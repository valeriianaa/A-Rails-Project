require "test_helper"

class EspecialidadesDeContactoControllerTest < ActionController::TestCase
  def especialidad_de_contacto
    @especialidad_de_contacto ||= especialidades_de_contacto :one
  end

  def test_index
    get :index
    assert_response :success
    assert_not_nil assigns(:especialidades_de_contacto)
  end

  def test_new
    get :new
    assert_response :success
  end

  def test_create
    assert_difference("EspecialidadDeContacto.count") do
      post :create, especialidad_de_contacto: { descripcion: especialidad_de_contacto.descripcion, nombre: especialidad_de_contacto.nombre }
    end

    assert_redirected_to especialidad_de_contacto_path(assigns(:especialidad_de_contacto))
  end

  def test_show
    get :show, id: especialidad_de_contacto
    assert_response :success
  end

  def test_edit
    get :edit, id: especialidad_de_contacto
    assert_response :success
  end

  def test_update
    put :update, id: especialidad_de_contacto, especialidad_de_contacto: { descripcion: especialidad_de_contacto.descripcion, nombre: especialidad_de_contacto.nombre }
    assert_redirected_to especialidad_de_contacto_path(assigns(:especialidad_de_contacto))
  end

  def test_destroy
    assert_difference("EspecialidadDeContacto.count", -1) do
      delete :destroy, id: especialidad_de_contacto
    end

    assert_redirected_to especialidades_de_contacto_path
  end
end
