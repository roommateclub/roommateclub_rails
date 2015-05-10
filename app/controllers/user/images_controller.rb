class User::ImagesController < User::BaseController
  
  def create
    images = []
    params[:file].each_value do |file|
      image = Image.new
      image.file = file
      insert_image_to_apartment(params[:apartment_id], image)
      images << image.id.to_s if image.save
    end
    respond_to do |format|
      format.json{ render json: images, status: :created }
    end
  end

  def destroy
    @image = Image.find(params[:id])
    @image.destroy!
    respond_to do |format|
      format.json {render json: {success: true}}
    end
  end

  private

  def insert_image_to_apartment(apartment_id, image)
    if apartment_id.present?
      image.viewable_type = "Apartment"
      image.apartment = Apartment.find(apartment_id)
    end
  end

  # def image_params
  #   params[:image].permit(:file)
  # end
end
