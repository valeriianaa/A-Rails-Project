require "test_helper"

class DbBackupTest < ActiveSupport::TestCase
  def db_backup
    @db_backup ||= DbBackup.new
  end

  def test_valid
    assert db_backup.valid?
  end
end
