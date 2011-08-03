class CommentsController < ApplicationController
  # GET /comments
  # GET /comments.xml
  def index
    @comments = Comment.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @comments }
    end
  end

  # GET /comments/1
  # GET /comments/1.xml
  def show
    @comment = Comment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @comment }
    end
  end

  # GET /comments/new
  # GET /comments/new.xml
  def new
    @comment = Comment.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @comment }
    end
  end

  # GET /comments/1/edit
  def edit
    @comment = Comment.find(params[:id])
    @comment.comment_text = @comment.comment_text.gsub '<br>', "\n"
    @game = Game.find(@comment.game_id)
    
    respond_to do |format|
      format.js
    end
  end

  # POST /comments
  # POST /comments.xml
  def create
    @comment = Comment.new(params[:comment])
    @comment.comment_text = @comment.comment_text.gsub /\n/, '<br>'
    @game = Game.find(@comment.game_id)
    @new_comment_id = @comment.id

    respond_to do |format|
      if @comment.save
        format.js
        format.html { redirect_to(@game, :notice => 'Comment was successfully created.') }
        format.xml  { render :xml => @game, :status => :created, :location => @comment }
      else
        format.js
        format.html { render :action => "new" }
        format.xml  { render :xml => @comment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /comments/1
  # PUT /comments/1.xml
  def update
    @comment = Comment.find(params[:id])
    params[:comment][:comment_text] = params[:comment][:comment_text].gsub /\n/, '<br>'
    @game = Game.find(@comment.game_id)

    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        format.js
        format.html { redirect_to(@game, :notice => 'Comment was successfully updated.') }
        format.xml  { head :ok }
      else
        format.js
        format.html { render :action => "edit" }
        format.xml  { render :xml => @comment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.xml
  def destroy
    @comment = Comment.find(params[:id])
    @game = Game.find(@comment.game_id)
    @comment.destroy

    respond_to do |format|
      format.js { render :nothing => true }
      format.html { redirect_to(@game) }
      format.xml  { head :ok }
    end
  end
end
