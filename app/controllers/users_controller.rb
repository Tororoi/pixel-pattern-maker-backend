class UsersController < ApplicationController
    skip_before_action :authorized, only: [:create, :index]

    def index 
        @users = User.all
        render json: @users
    end

    def profile
        render json: { user: UserSerializer.new(current_user) }, status: :accepted
    end

    def create
        @user = User.create(user_params)
        if @user.valid?
            @token = encode_token(user_id: @user.id)
            render json: { user: UserSerializer.new(@user), jwt: @token }, status: :created
        else
            render json: { error: 'failed to create user' }, status: :not_acceptable
        end
    end

    def fave_pattern
        @fave = current_user.favorites.create(pattern_id: fave_params[:pattern_id])
        render json: { favorite: FavoriteSerializer.new(@fave)}, status: 200
    end

    def unfave_pattern
        Favorite.destroy(unfave_params[:favorite_id])
    end

    def destroy
        @user = User.find(params[:id])
        if @user.patterns != [] || @user.favorites != []
            render json: { error: 'failed to delete user' }, status: :not_acceptable
        else
            @user.destroy
        end
    end

    private

    def user_params
        params.permit(:username, :password, :avatar)
    end

    def fave_params
        params.permit(:pattern_id)
    end

    def unfave_params
        params.permit(:favorite_id)
    end
end
