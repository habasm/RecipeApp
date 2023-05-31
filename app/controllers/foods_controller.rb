# frozen_string_literal: true

class FoodsController < ApplicationController
  before_action :authenticate_user!
  def index; end

  def show
    if params[:id] == 'sign_out'
      logout_user
    else
      set_user
    end
  end

  def new; end

  private

  def logout_user
    sign_out current_user
    redirect_to new_user_session_path
  end
end
