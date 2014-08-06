class MapsController < ApplicationController
def index
		@maps = Map.all
		respond_to do |format|
			format.html
			format.json {render json:@maps}
			format.xml {render xml:@maps}
		end				
	end

	def new 
		@map = Map.new
		#redirect_to maps_path
	end

	def show
		map = Map.find(params[:id])
		render json: map
	end

	def create
		#menyimpan semua params dari user
		#render json: params
		@map = Map.new(params.require(:map).permit(:name, :latitude, :longitude))
		if @map.save
			redirect_to maps_path, notice: 'Successfully save the post'	
		else
			render :new	
		end
	end
	def edit
		@map = Map.find(params[:id])
	end
	def update
		@map = Map.find(params[:id])
		if 
			@map.update(params.require(:map).permit(:name, :latitude, :longitude))
			redirect_to maps_path, notice: 'post Successfully update'
		else
			render :edit
		end
	end

	def destroy
    @map = Map.find(params[:id])
    @map.destroy
    respond_to do |format|
      format.html { redirect_to maps_path, notice: 'Model was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
end

