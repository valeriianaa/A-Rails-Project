class DbBackupsController < ApplicationController

  def new
    fecha = Time.now.strftime("%d-%m-%Y")
    %x[pg_dump incubadora_development -f db/backup-#{fecha}.sql]
    send_file "db/backup-#{fecha}.sql"
  end

end
