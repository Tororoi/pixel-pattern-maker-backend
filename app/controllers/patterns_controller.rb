class PatternsController < ApplicationController
    skip_before_action :authorized, only: [:index, :destroy]

    def index 
        @patterns = Pattern.all
        render json: @patterns
    end

    def create
        @pattern = Pattern.make(current_user, pattern_params, palette_params)

        if @pattern.valid?
            render json: { pattern: PatternSerializer.new(@pattern) }, status: :created
        else
            render json: { error: 'failed to create pattern' }, status: :not_acceptable
        end
    end

    def update
        @pattern = Pattern.find(params[:id])
        # @pattern.edit(pattern_params, paletteID_params[:paletteID], palette_params)
        @pattern.update(pattern_params)
        @palette = Palette.find(paletteID_params[:paletteID])
        @palette.palette_colors.destroy_all
        palette_params[:colors].each {|color| @palette.colors.find_or_create_by(hex: color)}

        render json: { pattern: PatternSerializer.new(@pattern) }
    end

    def destroy
        @pattern = Pattern.find(params[:id])
        @pattern.favorites.destroy_all
        @pattern.palettes.each {|p| p.palette_colors.destroy_all}
        @pattern.palettes.destroy_all
        Pattern.destroy(params[:id])
    end

    private

    def pattern_params
        params.require(:pattern).permit(:name, :image, :size)
    end

    def palette_params
        params.permit(colors: [])
    end

    def paletteID_params
        params.permit(:paletteID)
    end
end
