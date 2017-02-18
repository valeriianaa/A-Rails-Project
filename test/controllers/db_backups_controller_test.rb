require "test_helper"

class DbBackupsControllerTest < ActionController::TestCase
  def db_backup
    @db_backup ||= db_backups :one
  end

  def test_index
    get :index
    assert_response :success
    assert_not_nil assigns(:db_backups)
  end

  def test_new
    get :new
    assert_response :success
  end

  def test_create
    assert_difference("DbBackup.count") do
      post :create, db_backup: {  }
    end

    assert_redirected_to db_backup_path(assigns(:db_backup))
  end

  def test_show
    get :show, id: db_backup
    assert_response :success
  end

  def test_edit
    get :edit, id: db_backup
    assert_response :success
  end

  def test_update
    put :update, id: db_backup, db_backup: {  }
    assert_redirected_to db_backup_path(assigns(:db_backup))
  end

  def test_destroy
    assert_difference("DbBackup.count", -1) do
      delete :destroy, id: db_backup
    end

    assert_redirected_to db_backups_path
  end
end
