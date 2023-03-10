class UsersController < ApplicationController

    def index
        render json: User.all
    end

    def create
        user = User.new(params.require(:user).permit(:username))
        # replace the `user_attributes_here` with the actual attribute keys
        if user.save
            render json: user, status: :created
        else
            render json: user.errors.full_messages, status: :unprocessable_entity
        end
    end

    def show
        user = User.find_by(id: params[:id])
        if user.nil?
            render plain: 'user doesnt exist'
        else
            render json: User.find(params[:id])
        end

    end

    def update
        
        user = User.find_by(id: params[:id])
        if user.nil?
            render plain: 'user doesnt exist'
        else
            user.update!(user_params)
            render json: user
        end
        
       
    end
    
    def destroy
        user = User.find_by(id: params[:id])
        if user.nil?
            render plain: 'user doesnt exist'
            # render json: user.errors.full_messages, status: :unprocessable_entity
        else 
            user.delete
            render json: User.all
        end

    end

    private 

    def user_params

        params.require(:user).permit(:username)
    end
end
