class GamesController < ApplicationController

  # GET /games
  # GET /games.xml
  def index
    @game = @games.first 
    
    if @game
      respond_to do |format|
        format.html # index.html.erb
        format.xml  { render :xml => @games }
      end
    else 
      render 'no_game'
    end
  end

  # GET /games/1
  # GET /games/1.xml
  def show
    if params[:id]
      @game = Game.find(params[:id])
      @game_title = "Upcoming Game"
    else
      @game = @games.first 
      @game_title = "Next Game"
    end
        
    if @game.nil?
      render 'no_game'
      return
    end
    
        
    if (user_signed_in?) 
      @rsvp = @game.rsvps.where(:user_id => current_user.id).first
      if @rsvp
        if @rsvp.resp == 'Y' 
          @current_user_reply = 'Playing'
        elsif @rsvp.resp == 'N'
          @current_user_reply = 'Not Playing'
        else
          @current_user_reply = 'Undecided'
        end
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
    @email_on_submit = "Automatically email players about new game"
    @show_comment_form = true
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @game }
    end
  end

  # GET /games/1/edit
  def edit
    @game = Game.find(params[:id])
    @game.address = @game.address.gsub '<br>', "\n"
    @email_on_submit = "Automatically notify players of changes"
    
    @show_comment_form = false
  end

  # POST /games
  # POST /games.xml
  def create
    @game = Game.new(params[:game])
    @game.address = @game.address.gsub /\n/, '<br>'
    @show_comment_form = true ;
    
    comment_text = params[:first_comment]
    
    respond_to do |format|
      if @game.save
      
        if comment_text != ''
          comment_text = comment_text.gsub /\n/ , '<br>' 
          Comment.create(:user_id => current_user.id, :game_id => @game.id, :comment_text => comment_text)
        end
      
        User.find(:all).each do |user|
          rsvp = Rsvp.new 
          rsvp.user_id = user.id
          rsvp.game_id= @game.id 
          rsvp.save()
          
          if (user.email == 'benjamin.m.wilhelm@gmail.com' or RAILS_ENV == "production")
            Notifier.game_created(rsvp).deliver
          end
        end
        
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
    comment_text = params[:first_comment]
    params[:game][:address] = params[:game][:address].gsub /\n/, '<br>'
    
    respond_to do |format|
      if @game.update_attributes(params[:game])
        if comment_text and comment_text != ''
          comment_text = comment_text.gsub /\n/, '<br>'
          Comment.create(:user_id => current_user.id, :game_id => @game.id, :comment_text => comment_text)
        end
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
  
  
  # GET /games/1/email_players
  def new_email_to_players
    @game = Game.find(params[:id])
    
    respond_to do |format|
      format.js
    end 
  end
  
  # POST /games/1/email_players
  def send_email_to_players
    
    @send_list = []
    if params[:players_all]
      @send_list = User.find(:all)
    else 
      if params[:players_yes]
        recips = User.where("users.id IN (SELECT user_id FROM rsvps WHERE resp='Y' AND game_id=?)", params[:game_id]).all
        recips.each do |recip|
          @send_list.push(recip)
        end
      end
      
      if params[:players_no]
        recips = User.where("users.id IN (SELECT user_id FROM rsvps WHERE resp='N' AND game_id=?)", params[:game_id]).all
        recips.each do |recip|
          @send_list.push(recip)
        end
      end
      
      if params[:players_undecided]
        recips = User.where("users.id IN (SELECT user_id FROM rsvps WHERE resp IS NULL AND game_id=?)", params[:game_id]).all
        recips.each do |recip|
          @send_list.push(recip)
        end
      end
    end
    
    @send_list.each do |recip|
      if (recip.email == 'benjamin.m.wilhelm@gmail.com' or RAILS_ENV == 'production')
        Notifier.email_players(recip.email, params).deliver
      end
    end
    
    if params[:post_as_comment] 
      @game = Game.find(params[:game_id])
      cmnt = Comment.new 
      cmnt.user_id = params[:sender_id]
      cmnt.game_id = params[:game_id]
      cmnt.comment_text = params[:email_text]
      cmnt.save
      
      @post_as_comment = true
    end

    respond_to do |format|
      format.js
    end
  end
    
end
