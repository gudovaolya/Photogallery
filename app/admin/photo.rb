ActiveAdmin.register Photo do

permit_params :title, :image


form do |f|
  f.inputs do  
    f.input :title     
    f.input :image, :as => :file, :hint => image_tag(f.object.image.url(:thumb))
  end
  f.actions
 end

index do
  selectable_column
  id_column
  column :image do |photo|
    image_tag photo.image.url(:thumb)
  end
  column :title do |photo|
    link_to photo.title, admin_photo_path(photo)
  end    
  actions
end

show do
 attributes_table do
   row :image do |photo|
     image_tag photo.image.url(:medium)
   end
   row :title   
 end
 active_admin_comments
end



# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end


end
