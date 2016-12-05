require "test_helper"

class EventosProyectosControllerTest < ActionController::TestCase
  def evento_proyecto
    @evento_proyecto ||= eventos_proyectos :one
  end

  def test_index
    get :index
    assert_response :success
    assert_not_nil assigns(:eventos_proyectos)
  end

  def test_new
    get :new
    assert_response :success
  end

  def test_create
    assert_difference("EventoProyecto.count") do
      post :create, evento_proyecto: {  }
    end

    assert_redirected_to evento_proyecto_path(assigns(:evento_proyecto))
  end

  def test_show
    get :show, id: evento_proyecto
    assert_response :success
  end

  def test_edit
    get :edit, id: evento_proyecto
    assert_response :success
  end

  def test_update
    put :update, id: evento_proyecto, evento_proyecto: {  }
    assert_redirected_to evento_proyecto_path(assigns(:evento_proyecto))
  end

  def test_destroy
    assert_difference("EventoProyecto.count", -1) do
      delete :destroy, id: evento_proyecto
    end

    assert_redirected_to eventos_proyectos_path
  end
end
