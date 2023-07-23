class UsersController < ApplicationController
    def index
        @users = User.all.page(params[:page])
    end

    def new
        @user = User.new
    end

    def create
        @user = User.create(users_params)
        if @user.save
            redirect_to users_path
        else
            render :new , status: :unprocessable_entity
        end
    end

    def show
        @user = User.find(params[:id])
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        if @user.update(users_params)
            redirect_to users_path
        else
            render :new
        end
    end

    def destroy
        @user = User.find(params[:id])
        @user.destroy
        redirect_to users_path
    end

    private
    def users_params
        params.require(:user).permit(:name,:email,:phone,:address,:profile_image)
    end
end
