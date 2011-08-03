class RsvpsController < ApplicationController

  before_filter :get_games

  # GET /rsvps
  # GET /rsvps.xml
  def index
    @rsvps = Rsvp.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @rsvps }
    end
  end

  # GET /rsvps/1
  # GET /rsvps/1.xml
  def show
    @rsvp = Rsvp.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @rsvp }
    end
  end

  # GET /rsvps/new
  # GET /rsvps/new.xml
  def new
    @rsvp = Rsvp.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @rsvp }
    end
  end

  # GET /rsvps/1/edit
  def edit
    @rsvp = Rsvp.find(params[:id])
  end

  # POST /rsvps
  # POST /rsvps.xml
  def create
    @rsvp = Rsvp.new(params[:rsvp])

    respond_to do |format|
      if @rsvp.save
        format.html { redirect_to(@rsvp, :notice => 'Rsvp was successfully created.') }
        format.xml  { render :xml => @rsvp, :status => :created, :location => @rsvp }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @rsvp.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /rsvps/1
  # PUT /rsvps/1.xml
  def update
    @rsvp = Rsvp.find(params[:id])
    @game = Game.find(@rsvp.game_id)

    respond_to do |format|
      if @rsvp.update_attributes(params[:rsvp])
        format.js
        format.html { redirect_to(@game, :notice => 'Rsvp was successfully updated.') }
        format.xml  { head :ok }
      else
        format.js
        format.html { render :action => "edit" }
        format.xml  { render :xml => @rsvp.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /rsvps/1
  # DELETE /rsvps/1.xml
  def destroy
    @rsvp = Rsvp.find(params[:id])
    @rsvp.destroy

    respond_to do |format|
      format.html { redirect_to(rsvps_url) }
      format.xml  { head :ok }
    end
  end
  
  # Emailed RSVP link reply
  def respond 
    saved = false
    resp = params[:resp]
    auth_token = params[:auth_token]
    rsvp = Rsvp.find(params[:id])

    if auth_token == rsvp.auth_token
      rsvp.resp = resp 
      if rsvp.save 
        saved = true
      end
    end
    
    if saved 
      notc = "Your response was successfully saved"
    else
      notc = "There was a problem updating your response from the link.  Please try logging in to respond"
    end
    
    respond_to do |format|
      format.html { redirect_to('/games/' + rsvp.game_id.to_s, :notice => notc) }
    end
    
  end
  
end
