class Book < ApplicationRecord
  
  
  belongs_to :user
  has_one_attached :profile_image
  
   def get_profile_image(width,height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpeg')
      profile_image.attach(io:File.open(file_path),filename:'no_image.jpeg',content_type:'image/jpeg')
    end
    profile_image.varian(resize_to_limit:[width,height]).processed
   end  
  
end
