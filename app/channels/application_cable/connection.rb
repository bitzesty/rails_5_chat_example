module ApplicationCable
  class Connection < ActionCable::Connection::Base
    glue_devise
    identified_by :current_user


    def connect
      logger.debug current_user
      #authenticate_user!
    end
  end
end
