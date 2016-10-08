class PerceptionUsersController < ApplicationController
  before_action :set_perception_user, only: [:show, :edit, :update, :destroy]

  # GET /perception_users
  # GET /perception_users.json
  def index
    @perception_users = PerceptionUser.all
  end

  # GET /perception_users/1
  # GET /perception_users/1.json
  def show
  end

  # GET /perception_users/new
  def new
    @perception_user = PerceptionUser.new
  end

  # GET /perception_users/1/edit
  def edit
  end

  # POST /perception_users
  # POST /perception_users.json
  def create
    @perception_user = PerceptionUser.new(perception_user_params)

    respond_to do |format|
      if @perception_user.save
        format.html { redirect_to @perception_user, notice: 'Perception user was successfully created.' }
        format.json { render :show, status: :created, location: @perception_user }
      else
        format.html { render :new }
        format.json { render json: @perception_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /perception_users/1
  # PATCH/PUT /perception_users/1.json
  def update
    respond_to do |format|
      if @perception_user.update(perception_user_params)
        format.html { redirect_to @perception_user, notice: 'Perception user was successfully updated.' }
        format.json { render :show, status: :ok, location: @perception_user }
      else
        format.html { render :edit }
        format.json { render json: @perception_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /perception_users/1
  # DELETE /perception_users/1.json
  def destroy
    @perception_user.destroy
    respond_to do |format|
      format.html { redirect_to perception_users_url, notice: 'Perception user was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_perception_user
      @perception_user = PerceptionUser.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def perception_user_params
      params.require(:perception_user).permit(:email, :username, :fullname, :password, :password_confirmation, :company)
    end
end
