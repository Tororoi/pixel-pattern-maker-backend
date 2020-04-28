class PalettesController < ApplicationController
    skip_before_action :authorized
    # , only: [:index]

    def index 
        @palettes = Palette.all
        render json: @palettes
    end

    def create
        @palette = current_user.palettes.create(palette_params)
        

        if @palette.valid?
            render json: { palette: PaletteSerializer.new(@palette) }, status: :created
        else
            render json: { error: 'failed to create pattern' }, status: :not_acceptable
        end
    end

    def update
        @palette = Palette.find(params[:id])
        @palette.update(palette_params)
        render json: { pattern: PaletteSerializer.new(@palette) }
    end

    def destroy
        Palette.destroy(params[:id])
    end

    private

    def palette_params
        params.require(:palette).permit(:name, :image)
    end
end
