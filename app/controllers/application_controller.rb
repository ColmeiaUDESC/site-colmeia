class ApplicationController < ActionController::Base
    add_flash_types :error, :warning, :success, :info
end
