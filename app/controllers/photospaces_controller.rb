 class PhotospacesController < ApplicationController
before_filter :load_photospace, :only => [:edit, :update, :destroy, :show]
access_control do
  allow all, :to => [:index, :show]
  allow :admin
  allow logged_in, :to => [:new, :create]
  allow :owner, :of => :photospace, :to => [:edit, :update, :destroy]
end

  # GET /photospaces
  # GET /photospaces.xml
  def index
    @search = Photospace.search(params[:search])
    @photospaces = @search.all

  end
  
  # GET /photospaces/1
  # GET /photospaces/1.xml
  def show
    @photospace = Photospace.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @photospace }
    end
  end

  # GET /photospaces/new
  # GET /photospaces/new.xml
  def new
    @photospace = Photospace.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @photospace }
    end
  end

  # GET /photospaces/1/edit
  def edit
    @photospace = Photospace.find(params[:id])
  end

  # POST /photospaces
  # POST /photospaces.xml
  def create
    @photospace = Photospace.new(params[:photospace])

    
      if @photospace.save
        flash[:notice] = 'Zdjêcie dodano.'
         redirect_to photospaces_path
        current_user.has_role!(:owner, @photospace) # przypisz rolê
      else
        render :action => 'new' 
       end
    
  end 

  # PUT /photospaces/1
  # PUT /photospaces/1.xml
  def update
    @photospace = Photospace.find(params[:id])

    respond_to do |format|
      if @photospace.update_attributes(params[:photospace])
        flash[:notice] = 'Photospace was successfully updated.'
        format.html { redirect_to(@photospace) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @photospace.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /photospaces/1 
  # DELETE /photospaces/1.xml
  def destroy
    @photospace = Photospace.find(params[:id])
    @photospace.destroy

    respond_to do |format|
      format.html { redirect_to(photospaces_url) }
      format.xml  { head :ok }
    end
  end

private
def load_photospace
@photospace = Photospace.find(params[:id])
end



end
