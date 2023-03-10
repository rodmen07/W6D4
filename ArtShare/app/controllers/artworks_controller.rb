class ArtworksController < ApplicationController
    def index
        render json: Artwork.all
        # if params[:user_id]
        # Artwork.artworks_for_user_id
    end

    def create
    art = Artwork.new(artwork_params)
        # replace the art_attributes_here` with the actual attribute keys
        if art.save
            render json: art, status: :created
        else
            render json: art.errors.full_messages, status: :unprocessable_entity
        end
    end

    def show
        art = Artwork.find_by(id: params[:id])
        if art.nil?
            render plain: 'art doesnt exist'
        else
            render json: Artwork.find(params[:id])
        end
    end

    def update

        art = Artwork.find_by(id: params[:id])
        if art.nil?
            render plain: 'art doesnt exist'
        else
            art.update!(artwork_params)
            render json: art
        end
    end

    def destroy
        art = Artwork.find_by(id: params[:id])
        if art.nil?
            render plain: 'art doesnt exist'
            # render json: art.errors.full_messages, status: :unprocessable_entity
        else
            art.delete
            render json: Artwork.all
        end
    end

    private

    def artwork_params

        params.require(:artwork).permit(:title, :image_url, :artist_id)
    end

end
