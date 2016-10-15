require "test_helper"

class TipoDocumentosControllerTest < ActionController::TestCase
  def tipo_documento
    @tipo_documento ||= tipo_documentos :one
  end

  def test_index
    get :index
    assert_response :success
    assert_not_nil assigns(:tipo_documentos)
  end

  def test_new
    get :new
    assert_response :success
  end

  def test_create
    assert_difference("TipoDocumento.count") do
      post :create, tipo_documento: { nombre: tipo_documento.nombre }
    end

    assert_redirected_to tipo_documento_path(assigns(:tipo_documento))
  end

  def test_show
    get :show, id: tipo_documento
    assert_response :success
  end

  def test_edit
    get :edit, id: tipo_documento
    assert_response :success
  end

  def test_update
    put :update, id: tipo_documento, tipo_documento: { nombre: tipo_documento.nombre }
    assert_redirected_to tipo_documento_path(assigns(:tipo_documento))
  end

  def test_destroy
    assert_difference("TipoDocumento.count", -1) do
      delete :destroy, id: tipo_documento
    end

    assert_redirected_to tipo_documentos_path
  end
end
