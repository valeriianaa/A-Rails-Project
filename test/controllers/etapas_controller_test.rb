require "test_helper"

class EtapasControllerTest < ActionController::TestCase
  def etapa
    @etapa ||= etapas :one
  end

  def test_index
    get :index
    assert_response :success
    assert_not_nil assigns(:etapas)
  end

  def test_new
    get :new
    assert_response :success
  end

  def test_create
    assert_difference("Etapa.count") do
      post :create, etapa: { descripcion: etapa.descripcion, nombre: etapa.nombre }
    end

    assert_redirected_to etapa_path(assigns(:etapa))
  end

  def test_show
    get :show, id: etapa
    assert_response :success
  end

  def test_edit
    get :edit, id: etapa
    assert_response :success
  end

  def test_update
    put :update, id: etapa, etapa: { descripcion: etapa.descripcion, nombre: etapa.nombre }
    assert_redirected_to etapa_path(assigns(:etapa))
  end

  def test_destroy
    assert_difference("Etapa.count", -1) do
      delete :destroy, id: etapa
    end

    assert_redirected_to etapas_path
  end
end
