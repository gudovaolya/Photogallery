class PhotosController < ApplicationController
  def index
    @photos = Photo.all    
  end

  def new
    @photo = Photo.new
  end

  def create    
    @photo = Photo.new(photo_params)
      if @photo.save            
        redirect_to root_path
      else        
        render 'new'          
      end       
  end

  def destroy
      Photo.destroy(params[:id])
      redirect_to :back
  end 

  def show
     @photo = Photo.find(params[:id])
     @photocomments = Photocomment.where(photo_id: @photo.id)   
     @average_photo = Photocomment.average(:score)
  end   

  private
  def photo_params
    params.require(:photo).permit(:image, :title, :user_id)  
  end
end
