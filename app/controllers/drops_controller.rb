class DropsController < ApplicationController
  # before_filter :login_required, :except => :download
  login_required :except => :download
  
  # GET /drops
  # GET /drops.xml
  def index
    # @drops = Drop.find(:all)
    @drops = current_user.drops # just the current user drops
    @breadcrumbs = ["home" => nil]
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @drops }
    end
  end

  # GET /drops/1
  # GET /drops/1.xml
  def show
    @drop = Drop.get(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @drop }
    end
  end

  # GET /drops/new
  # GET /drops/new.xml
  def new
    @drop = Drop.new
    @breadcrumbs = [{"home" => drops_url}, {"new file" => nil}]

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @drop }
    end
  end

  # GET /drops/1/edit
  def edit
    @drop = Drop.get(params[:id])
  end

  # POST /drops
  # POST /drops.xml
  def create
    @drop = Drop.new(params[:drop])
    @drop.user = current_user

    respond_to do |format|
      if @drop.save
        flash[:notice] = 'Drop was successfully created.'
        format.html { redirect_to(drops_url) }
        format.xml  { render :xml => @drop, :status => :created, :location => @drop }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @drop.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /drops/1
  # PUT /drops/1.xml
  def update
    @drop = Drop.get(params[:id])

    respond_to do |format|
      if @drop.update_attributes(params[:drop])
        flash[:notice] = 'Drop was successfully updated.'
        format.html { redirect_to(@drop) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @drop.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /drops/1
  # DELETE /drops/1.xml
  def destroy
    @drop = current_user.drops.get(params[:id])
    @drop.destroy

    respond_to do |format|
      format.html { redirect_to(drops_url) }
      format.xml  { head :ok }
    end
  end
  
  def download
    d = Drop.first(:uuid => params[:uuid])
    send_file d.file.path, :type => d.file_content_type
  end
  
  def terms
    @breadcrumbs = [{"home" => drops_url}, {"terms of service" => nil}]
  end
end
