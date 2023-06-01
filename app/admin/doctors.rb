ActiveAdmin.register Doctor do
  permit_params :avatar, :first_name, :last_name, :phone, :password, :doctor_category_id
  includes :category

  index do
    selectable_column
    id_column
    column :avatar do |resource|
      image_tag resource.avatar.thumb.url if resource.avatar?
    end
    column :category
    column :first_name
    column :last_name
    column :phone
    column :created_at
    column :updated_at
    actions
  end

  filter :category
  filter :first_name
  filter :last_name
  filter :phone
  filter :created_at
  filter :updated_at

  show do
    attributes_table do
      row :avatar do |resource|
        image_tag resource.avatar.thumb.url if resource.avatar?
      end
      row :category
      row :first_name
      row :last_name
      row :phone
      row :created_at
      row :updated_at
    end
  end

  form do |f|
    f.semantic_errors
    inputs do
      input :category
      input :avatar
      input :first_name
      input :last_name
      input :phone
      input :password if object.new_record?
    end
    f.actions
  end
end
