class User::ImagesController < User::BaseController
  def create
    @image = Image.new(file: params[:file])
    # binding.remote_pry
    if @image.save!
      respond_to do |format|
        format.json{ render json: @image, status: :created }
      end
    else
    end
  end

  def destroy
    @image = Image.find(params[:id])
    
  end

  private

  # def image_params
  #   params[:image].permit(:file)
  # end
end
