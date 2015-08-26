module ApplicationCable
  class Connection < ActionCable::Connection::Base
    glue_devise
    identified_by :current_user


    def connect
      authenticate_user!
    end
  end
end
