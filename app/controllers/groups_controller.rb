class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :edit, :update, :destroy]
  before_action :authentication_required, only: [:new, :edit, :create, :update, :destroy]

  def index
    @groups = Group.near(current_user, 20, :order => "distance")
    @full_groups = Group.all
    @users = User.all
    @all_groups = Group.near(current_user, 10000, :order => "distance")
  end

  def show
    @admin = User.find(@group.admin.id)
    if current_user
      @request = Request.find_open_request_by_user_and_group(current_user, @group)
    end
  end

  def new
    @group = Group.new
    @unique_instrumentations = Instrumentation.all[0..15]
  end

  def edit
    @unique_instrumentations = Instrumentation.all[0..15]
    if current_user == @group.admin
      render 'edit'
    else
      redirect_to @group, notice: 'You do not have editing rights for this group'
    end
  end

  def create

    if group_params["instrumentation_id"]=="16"
      @group = Group.new
      @group.custom_type = params[:custom_type]
      @group.save
      @admin = User.find(params[:group][:admin_id])
      @group.zipcode = @admin.zipcode
      @group.name = group_params[:name]
      @group.admin_id = group_params[:admin_id]
      @group.instrument_ids = group_params[:instrument_ids]
    else
      @group = Group.new(group_params)
      @admin = User.find(params[:group][:admin_id])
      @group.zipcode = @admin.zipcode
    end



    respond_to do |format|
      if @group.save
        @request = Request.create(user_id: current_user.id, group_id: @group.id, user_approved: true, group_approved: true, finalized: true)
        format.html { redirect_to @group, notice: 'Group was successfully created.' }
        format.json { render :show, status: :created, location: @group }
      else
        format.html { render :new }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @group.update(group_params)
        format.html { redirect_to @group, notice: 'Group was successfully updated.' }
        format.json { render :show, status: :ok, location: @group }
      else
        format.html { render :edit }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    if current_user == @group.admin
      @group.destroy
      respond_to do |format|
        format.html { redirect_to groups_url }
        format.json { head :no_content }
      end
    else
      redirect_to @group, notice: 'You do not have editing rights for this group'
    end
  end

  private
    def set_group
      @group = Group.find(params[:id])
    end

    def group_params
      params.require(:group).permit(:name, :instrumentation_id, :complete, :admin_id, :leave, :instrument_ids => [])
    end
end
