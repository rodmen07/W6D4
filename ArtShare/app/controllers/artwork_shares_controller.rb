class ArtworkSharesController < ApplicationController
    def index
        render json: ArtworkShare.all
    end

    def create
    share = ArtworkShare.new(artwork_share_params)
    # debugger
        # replace the art_attributes_here` with the actual attribute keys
        if share.save!
            render json: share, status: :created
        else
            render json: share.errors.full_messages, status: :unprocessable_entity
        end
    end

    def show
        share = ArtworkShare.find_by(id: params[:id])
        if share.nil?
            render plain: 'share doesnt exist'
        else
            render json: ArtworkShare.find(params[:id])
        end
    end

    def update
        
        share = ArtworkShare.find_by(id: params[:id])
        if share.nil?
            render plain: 'share doesnt exist'
        else
            share.update!(artwork_share_params)
            render json: share
        end  
    end
    
    def destroy
        share = ArtworkShare.find_by(id: params[:id])
        if share.nil?
            render plain: 'share doesnt exist'
            # render json: share.errors.full_messages, status: :unprocessable_entity
        else 
            share.delete
            render json: ArtworkShare.all
        end
    end

    private 

    def artwork_share_params

        params.require(:artwork_share).permit(:artwork_id, :viewer_id)
    end
end