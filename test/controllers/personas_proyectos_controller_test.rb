require "test_helper"

class PersonasProyectosControllerTest < ActionController::TestCase
  def persona_proyecto
    @persona_proyecto ||= personas_proyectos :one
  end

  def test_index
    get :index
    assert_response :success
    assert_not_nil assigns(:personas_proyectos)
  end

  def test_new
    get :new
    assert_response :success
  end

  def test_create
    assert_difference("PersonaProyecto.count") do
      post :create, persona_proyecto: {  }
    end

    assert_redirected_to persona_proyecto_path(assigns(:persona_proyecto))
  end

  def test_show
    get :show, id: persona_proyecto
    assert_response :success
  end

  def test_edit
    get :edit, id: persona_proyecto
    assert_response :success
  end

  def test_update
    put :update, id: persona_proyecto, persona_proyecto: {  }
    assert_redirected_to persona_proyecto_path(assigns(:persona_proyecto))
  end

  def test_destroy
    assert_difference("PersonaProyecto.count", -1) do
      delete :destroy, id: persona_proyecto
    end

    assert_redirected_to personas_proyectos_path
  end
end
