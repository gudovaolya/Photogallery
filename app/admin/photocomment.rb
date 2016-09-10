ActiveAdmin.register Photocomment do

permit_params :content, :score, :photo_id, :user_id


form do |f|
  f.inputs do  
    f.input :content
    f.input :score   
    f.input :photo_id
    f.input :user_id   
  end
  f.actions
 end

index do
  selectable_column
  id_column
  column :photo_id do |photocomment|
    image_tag photocomment.photo.image.url(:thumb)
  end
  column :content
  column :score
  column :photo_id
  column :user_id  
  actions
end

show do
 attributes_table do
   row :photo_id do |photocomment|
     photocomment.photo.title
   end
   row :photo_id do |photocomment|
     image_tag photocomment.photo.image.url(:medium)
   end
   row :content   
   row :score   
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
