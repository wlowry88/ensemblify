class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :edit, :update, :destroy]
  before_action :authentication_required, only: [:new, :edit, :create, :update, :destroy]

  def index
    @groups = Group.all
    @users = User.all
  end

  def show
    @admin = User.find(@group.admin.id)
    @request = Request.find_open_request_by_user_and_group(current_user, @group)
  end

  def new
    @group = Group.new
  end

  def edit
    if current_user == @group.admin
      render 'edit'
    else
      redirect_to @group, notice: 'You do not have editing rights for this group'
    end
  end

  def create
    @group = Group.new(group_params)
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
        format.html { redirect_to groups_url, notice: 'Group was successfully destroyed.' }
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
      params.require(:group).permit(:name, :instrumentation_id, :complete, :admin_id)
    end
end
