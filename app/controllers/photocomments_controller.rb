class PhotocommentsController < ApplicationController
  
  def new
    @photocomment = current_user.photocomment.build
  end

  def create 
    @photo = Photo.find(params[:photo_id])    
    @photocomment = @photo.photocomments.build(photocomment_params) 
    @photocomment.user_id = current_user.id 
    if @photocomment.save            
      redirect_to :back
    else        
      render 'new'          
    end       
  end

  def destroy
      Photocomment.destroy(params[:id])
      redirect_to :back
  end   

  private
  def photocomment_params
    params.require(:photocomment).permit(:content, :score, :user_id, :photo_id)  
  end
end
