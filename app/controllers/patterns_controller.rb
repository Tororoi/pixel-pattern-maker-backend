class PatternsController < ApplicationController
    skip_before_action :authorized
    # , only: [:index]

    def index 
        @patterns = Pattern.all
        render json: @patterns
    end

    def create
        @pattern = Pattern.parse(current_user, pattern_params, palette_params)

        if @pattern.valid?
            render json: { pattern: PatternSerializer.new(@pattern) }, status: :created
        else
            render json: { error: 'failed to create pattern' }, status: :not_acceptable
        end
    end

    def update
        @pattern = Pattern.find(params[:id])
        @pattern.update(pattern_params)
        render json: { pattern: PatternSerializer.new(@pattern) }
    end

    def destroy
        @pattern = Pattern.find(params[:id])
        @pattern.palettes.each {|p| p.palette_colors.destroy_all}
        @pattern.palettes.destroy_all
        Pattern.destroy(params[:id])
    end

    private

    def pattern_params
        params.require(:pattern).permit(:name, :image)
    end

    def palette_params
        params.permit(colors: [])
    end
end
