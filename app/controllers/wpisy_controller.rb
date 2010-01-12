class WpisyController < ApplicationController

access_control do
  allow all, :to => [:index, :show]
  allow :admin
  allow logged_in, :to => [:new, :create]
  allow :owner, :of => :wpis, :to => [:edit, :update, :destroy]
end
def create
   @photospace = Photospace.find(params[:photospace_id])
   @wpis = @photospace.wpisy.create!(params[:wpis])
   current_user.has_role!(:owner, @wpis) # przypisz rolê
   redirect_to @photospace
end

  def destroy
    @wpis = Wpis.find(params[:id])
    @wpis.destroy

    respond_to do |format|
      format.html { redirect_to(photospaces_url) }
      format.xml  { head :ok }
    end
  end

def load_wpis
@wpis = Wpis.find(params[:id])
end
end