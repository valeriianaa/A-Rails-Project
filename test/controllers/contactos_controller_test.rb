require "test_helper"

class ContactosControllerTest < ActionController::TestCase
  def contacto
    @contacto ||= contactos :one
  end

  def test_index
    get :index
    assert_response :success
    assert_not_nil assigns(:contactos)
  end

  def test_new
    get :new
    assert_response :success
  end

  def test_create
    assert_difference("Contacto.count") do
      post :create, contacto: {  }
    end

    assert_redirected_to contacto_path(assigns(:contacto))
  end

  def test_show
    get :show, id: contacto
    assert_response :success
  end

  def test_edit
    get :edit, id: contacto
    assert_response :success
  end

  def test_update
    put :update, id: contacto, contacto: {  }
    assert_redirected_to contacto_path(assigns(:contacto))
  end

  def test_destroy
    assert_difference("Contacto.count", -1) do
      delete :destroy, id: contacto
    end

    assert_redirected_to contactos_path
  end
end
