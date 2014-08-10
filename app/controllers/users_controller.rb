class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  skip_before_action :registered?, only: [:show, :edit, :update, :create]

  def index
    @all_users = User.near(current_user, 10000, :order => "distance")
    @full_users = User.all
    @instrument_list = Instrument.order(:name)
    @ensemble_types = Instrumentation.order(:name)
  end

  def show
  end

  def send_email
    @recipient_name = params[:recipient_name]
    @recipient_email = params[:recipient_email]
    @sender_name = params[:sender_name]
    @sender_email = params[:sender_email]
    @content = params[:content]
    UserMailer.contact_user(@sender_name, @sender_email, @recipient_name, @recipient_email, @content).deliver
    redirect_to User.find_by(email: @recipient_email)
  end

  def edit
    @instrument_list = Instrument.order(:name)
    @ensemble_types = Instrumentation.all
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update

    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'Profile was successfully updated' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { redirect_to @user, notice: 'Please include instrument and zipcode :)' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :instrument_id, :gender, :first_name, :last_name, :short_bio, :image, :email, :zipcode, :instrument, :level, :video_sample, :audio_sample, :phone_number, :available, :instrumentation_ids => [])
    end
end
