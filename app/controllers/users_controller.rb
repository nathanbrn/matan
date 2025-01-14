class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]

  # GET /users or /users.json
  def index
    @users = User.all
    render inertia: "Users/Index", props: { users: @users.as_json }
  end

  def show
  end

  # GET /users/new
  def new
    @user = User.new
    render inertia: "Users/New", props: { user: @user.as_json }
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to users_path, notice: "Usuário criado com sucesso."
    else
      redirect_to new_user_path, inertia: { errors: @user.errors.full_messages }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
    render inertia: "Users/Edit", props: { user: @user, users: @users }
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to users_path, notice: "Usuário atualizado com sucesso."
    else
      render inertia: "Users/Edit", props: { user: @user, users: @users }
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user = User.find(params[:id])

    if @user.destroy
      redirect_to users_path, notice: "Usuário deletado com sucesso."
    else
      redirect_to users_path, error: "Erro ao deletar usuário."
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @users = User.all
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:description, :username, :password)
    end
end
