class UniClassesController < ApplicationController
  
  before_filter :authenticate_user!
  load_and_authorize_resource

  # GET /uni_classes
  # GET /uni_classes.json
  def index
    @uni_classes = UniClass.search(params)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @uni_classes }
    end
  end

  def search
    @subjects = ["", "Computer Science", "Software Engineering", "Mathematics", "English"]
  end

  def register
    uni_class = UniClass.find_by_id(params[:id])
    if (not current_user.classes.include? uni_class)
      current_user.classes << uni_class
      current_user.save!
    end
    redirect_to request.referer
  end

  def deregister
    current_user.classes.delete(UniClass.find_by_id params[:id])
    redirect_to request.referer, :notice => 'Class deleted successfully'
  end

  def my_classes
    @classes = current_user.classes

  end
  # GET /uni_classes/1
  # GET /uni_classes/1.json
  def show
    @uni_class = UniClass.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @uni_class }
    end
  end

  # GET /uni_classes/new
  # GET /uni_classes/new.json
  def new
    @uni_class = UniClass.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @uni_class }
    end
  end

  # GET /uni_classes/1/edit
  def edit
    @uni_class = UniClass.find(params[:id])
  end

  # POST /uni_classes
  # POST /uni_classes.json
  def create
    @uni_class = UniClass.new(params[:uni_class])

    respond_to do |format|
      if @uni_class.save
        format.html { redirect_to @uni_class, notice: 'Uni class was successfully created.' }
        format.json { render json: @uni_class, status: :created, location: @uni_class }
      else
        format.html { render action: "new" }
        format.json { render json: @uni_class.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /uni_classes/1
  # PUT /uni_classes/1.json
  def update
    @uni_class = UniClass.find(params[:id])

    respond_to do |format|
      if @uni_class.update_attributes(params[:uni_class])
        format.html { redirect_to @uni_class, notice: 'Uni class was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @uni_class.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /uni_classes/1
  # DELETE /uni_classes/1.json
  def destroy
    @uni_class = UniClass.find(params[:id])
    @uni_class.destroy

    respond_to do |format|
      format.html { redirect_to uni_classes_url }
      format.json { head :no_content }
    end
  end
end
