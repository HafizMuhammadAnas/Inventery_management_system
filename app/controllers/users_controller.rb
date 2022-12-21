class UsersController < ApplicationController
  require 'csv'
  before_action :authenticate_user!
  def index
    @user = User.all
  end

  def import
    if params[:file].present?

      # file = File.read(params[:file])

      csv = CSV.parse(params[:file].tempfile, headers: true, col_sep: ',')
        csv.each do |row|
          # var = row.to_h.except('image')
          user = User.new(row.to_h.except('user_image'))
          debugger
          user.user_image = URI.parse(row['user_mage'])
          user.save!
          # if user.save
            # user.grab_image(row['user_image']) if row['user_image'].present?
          # end
        end
      end
      redirect_to user_path, notice: 'Users imported!'
    end
  # def import
  #  @import = User.import(params[:file].path)


  #   if user.save
  #     user.grab_image(row['url']) if row['url'].present?
  #   end
  # end

  def edit
    @user = current_user
  end

  def update_password
    @user = current_user
    if @user.update(user_params)
      # Sign in the user by passing validation in case their password changed
      bypass_sign_in(@user)
      redirect_to root_path
    else
      render "edit"
    end
  end

  private

  def user_params
    # NOTE: Using `strong_parameters` gem
    params.require(:user).permit(:password, :password_confirmation)
  end
end
