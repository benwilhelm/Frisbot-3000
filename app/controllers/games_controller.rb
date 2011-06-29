class GamesController < ApplicationController

  # GET /games
  # GET /games.xml
  def index
    @game = @games.first 
    @undecided = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @games }
    end
  end

  # GET /games/1
  # GET /games/1.xml
  def show
    if params[:id]
      @game = Game.find(params[:id])
    else
      @game = @games.first 
    end
    
    @yesses = @game.rsvps.where("resp = 'Y'")
    @nos = @game.rsvps.where("resp = 'N'")
    @undecided = @game.rsvps.where("resp IS NULL")
    
    if @game.polling_cutoff.future? 
      if @yesses.count < @game.min_players
        needed = @game.min_players - @yesses.count
        @game_status = "Still waiting for " + needed.to_s + " more."
      else
        @game_status = "Game Tentatively On"
      end
      @summary_class = "game-maybe"
      @polling_status = "Polling closes " + @game.polling_cutoff.to_s(:cutoff_time) 
    else
      if @yesses.count < @game.min_players
        @game_status = "No Game"
        @summary_class = "game-off"
        @polling_status = "Polling closed. See you next time."
      else
        @game_status = "Game On"
        @summary_class = "game-on"
        if @game.location
          @polling_status = "See you at " + @game.location + "!"
        else
          @polling_status = "See you on the field!"
        end
      end
    end
    
    if (user_signed_in?) 
      rsvp = @game.rsvps.where(:user_id => current_user.id).first
      resp = rsvp.resp
      if resp == 'Y' 
        @current_user_reply = 'Playing'
      elsif resp == 'N'
        @current_user_reply = 'Not Playing'
      else
        @current_user_reply = 'Undecided'
      end
    end

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @game }
    end
  end

  # GET /games/new
  # GET /games/new.xml
  def new
    @game = Game.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @game }
    end
  end

  # GET /games/1/edit
  def edit
    @game = Game.find(params[:id])
  end

  # POST /games
  # POST /games.xml
  def create
    @game = Game.new(params[:game])

    respond_to do |format|
      if @game.save
        format.html { redirect_to(@game, :notice => 'Game was successfully created.') }
        format.xml  { render :xml => @game, :status => :created, :location => @game }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @game.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /games/1
  # PUT /games/1.xml
  def update
    @game = Game.find(params[:id])

    respond_to do |format|
      if @game.update_attributes(params[:game])
        format.html { redirect_to(@game, :notice => 'Game was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @game.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /games/1
  # DELETE /games/1.xml
  def destroy
    @game = Game.find(params[:id])
    @game.destroy

    respond_to do |format|
      format.html { redirect_to(games_url) }
      format.xml  { head :ok }
    end
  end
  
  
  
end
