class UsersController < ApplicationController
  def new
    @user = User.new
    render :register
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id  # Iniciar sesión automáticamente después de registrarse
      redirect_to root_path, notice: 'Usuario registrado con éxito.'
    else
      render :register
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :location, :contact, :engineering_type, :password, :password_confirmation, :resume, :role)
  end
  
end
