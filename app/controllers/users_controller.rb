class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "Registration successfull."
      redirect_to photospaces_url  # lepsze propozycje URI?
    else
      render :action => 'new'
    end
  end

  
  def edit
@user = current_user

  end
  
  def update
    @user = current_user
    if @user.update_attributes(params[:user])
      flash[:notice] = "Successfully updated profilr."
      redirect_to root_url
    else
      render :action => 'edit'
    end
  end
end
