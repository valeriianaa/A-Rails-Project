require "test_helper"

class PersonasControllerTest < ActionController::TestCase
  def persona
    @persona ||= personas :one
  end

  def test_index
    get :index
    assert_response :success
    assert_not_nil assigns(:personas)
  end

  def test_new
    get :new
    assert_response :success
  end

  def test_create
    assert_difference("Persona.count") do
      post :create, persona: { apellido: persona.apellido, direccion: persona.direccion, email: persona.email, fechaNacimiento: persona.fechaNacimiento, nombre: persona.nombre, nroIdentificacion: persona.nroIdentificacion, telefono: persona.telefono }
    end

    assert_redirected_to persona_path(assigns(:persona))
  end

  def test_show
    get :show, id: persona
    assert_response :success
  end

  def test_edit
    get :edit, id: persona
    assert_response :success
  end

  def test_update
    put :update, id: persona, persona: { apellido: persona.apellido, direccion: persona.direccion, email: persona.email, fechaNacimiento: persona.fechaNacimiento, nombre: persona.nombre, nroIdentificacion: persona.nroIdentificacion, telefono: persona.telefono }
    assert_redirected_to persona_path(assigns(:persona))
  end

  def test_destroy
    assert_difference("Persona.count", -1) do
      delete :destroy, id: persona
    end

    assert_redirected_to personas_path
  end
end
