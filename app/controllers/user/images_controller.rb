class User::ImagesController < User::BaseController
  def create
    images = []
    params[:file].each_value do |file|
      image = Image.new
      image.file = file
      images << image.id.to_s if image.save
    end
    respond_to do |format|
      format.json{ render json: images, status: :created }
    end
  end

  def destroy
    @image = Image.find(params[:id])
    @image.destroy!
    render json: {success: true} 
  end

  private

  # def image_params
  #   params[:image].permit(:file)
  # end
end
