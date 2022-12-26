class UsersController < ApplicationController
  require 'csv'
  before_action :authenticate_user!
  before_action :set_user, only: %i[edit update destroy]

  def index
    @user = User.all
  end

  def import
    if params[:file].present?

      # file = File.read(params[:file])

      csv = CSV.parse(params[:file].tempfile, headers: true, col_sep: ',')
        csv.each do |row|
          # var = row.to_h.except('image')
          user = User.new(row.to_h)

         # user.user_image = URI.parse(row['user_image'])
          user.save!
          # if user.save
            # user.grab_image(row['user_image']) if row['user_image'].present?
          # end
        end
      end
      redirect_to users_path, notice: 'Users imported!'
    end
  # def import
  #  @import = User.import(params[:file].path)


  #   if user.save
  #     user.grab_image(row['url']) if row['url'].present?
  #   end
  # end
  def new
		@user = User.new
	end
  def create
    # debugger
    @user = User.new(user_par)
      if @user.save!
        redirect_to users_path, notice: 'Book has been created successfuly'
      else
        render :new, status: :unprocessable_entity
      end

  end
  def edit
  end

  def update_password
    @user = current_user
    if @user.update!(user_par)
      # Sign in the user by passing validation in case their password changed
      bypass_sign_in(@user)
      redirect_to root_path
    else
      render "edit"
    end
  end
  def show
    @user = User.find_by(id: params[:id])

  end
  def destroy
    @user.destroy
    redirect_to users_path, alert: 'User has been deleted successfuly'
  end

  private

  def user_params
    # NOTE: Using `strong_parameters` gem
    params.require(:user).permit(:password, :password_confirmation, :current_password)
  end
  def user_par
    # NOTE: Using `strong_parameters` gem
    # params.require(:user).permit(:name, :role, :address)
    params.require(:user).permit(:email, :address, :name, :role, :password, :password_confirmation,  :contect_number ,:branch_name,:account_update,  :update_attrs, :image, :user_image)

  end


  def set_user
    @user = User.find_by(id: params[:id])
  end
end
