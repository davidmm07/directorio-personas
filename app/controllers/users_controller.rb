class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
 #before_action -> limitar actividades
  # GET /users verbos http para index (GET)
  # GET /users.json
  def index
    #Es lo mismo que decir select * from users se guarda en @users como una especie de lista
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json lo que se despliega en la pagina index
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json   verbos http para create (POST)
  # desde user_params se llaman los parametros del usuario, se puede llamar desde .new(:email)
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'Perfil de usuario ingresado exitosamente' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json verbos http para update (PATCH/PUT)
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'Perfil de usuario actualizado con exito' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'Perfil de Usuario Eliminado' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:nombres, :apellidos, :telefonos, :email, :usertype_id)
    end
end
