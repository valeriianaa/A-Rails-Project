class DeviseOverrides::SessionsController < Devise::SessionsController

  respond_to :json
  respond_to :html
  respond_to :xml

end