require "test_helper"

class MiembrosEquipoControllerTest < ActionController::TestCase
  def miembro_equipo
    @miembro_equipo ||= miembros_equipo :one
  end

  def test_index
    get :index
    assert_response :success
    assert_not_nil assigns(:miembros_equipo)
  end

  def test_new
    get :new
    assert_response :success
  end

  def test_create
    assert_difference("MiembroEquipo.count") do
      post :create, miembro_equipo: {  }
    end

    assert_redirected_to miembro_equipo_path(assigns(:miembro_equipo))
  end

  def test_show
    get :show, id: miembro_equipo
    assert_response :success
  end

  def test_edit
    get :edit, id: miembro_equipo
    assert_response :success
  end

  def test_update
    put :update, id: miembro_equipo, miembro_equipo: {  }
    assert_redirected_to miembro_equipo_path(assigns(:miembro_equipo))
  end

  def test_destroy
    assert_difference("MiembroEquipo.count", -1) do
      delete :destroy, id: miembro_equipo
    end

    assert_redirected_to miembros_equipo_path
  end
end
