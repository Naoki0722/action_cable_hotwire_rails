# frozen_string_literal: true

module RoomsHelper
  def recipient_list(login_user)
    User.except_current_user(login_user).map { |user| [ user.name, user.id ] }
  end
end
