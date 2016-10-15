require "test_helper"

class PaisesControllerTest < ActionController::TestCase
  def pais
    @pais ||= paises :one
  end

  def test_index
    get :index
    assert_response :success
    assert_not_nil assigns(:paises)
  end

  def test_new
    get :new
    assert_response :success
  end

  def test_create
    assert_difference("Pais.count") do
      post :create, pais: { nombre: pais.nombre }
    end

    assert_redirected_to pais_path(assigns(:pais))
  end

  def test_show
    get :show, id: pais
    assert_response :success
  end

  def test_edit
    get :edit, id: pais
    assert_response :success
  end

  def test_update
    put :update, id: pais, pais: { nombre: pais.nombre }
    assert_redirected_to pais_path(assigns(:pais))
  end

  def test_destroy
    assert_difference("Pais.count", -1) do
      delete :destroy, id: pais
    end

    assert_redirected_to paises_path
  end
end
