ActiveAdmin.register User do
    permit_params :name, :profilepc, :date_of_birth, :gender, :email, :password, :password_confirmation
  
    index do
      selectable_column
      id_column
      column :name
      column :email
      column :profilepc 
      column :date_of_birth
      column :gender
      column :current_sign_in_at
      column :sign_in_count
      column :created_at
      actions
    end
  
    filter :name
    filter :email
    filter :gender
   
    form :html => { :multipart => true } do |f|
      f.inputs "User Form" do
        f.input :name
        f.input :email
        f.input :password
        f.input :password_confirmation
        f.input :profilepc, :as => :file 
        f.input :date_of_birth, :start_year => 1990
        f.input :gender
      end
      f.actions
    end
  
  end