class Image < ActiveRecord::Base
  belongs_to :article
  
  named_scope :originals, :conditions => ["parent_id IS NULL"]
  
  has_attached_file :uploaded_data, 
    :styles => {:thumb100 => "100x100>", :thumb200 => "200x200>", :thumb300 => "300x300>", :thumb400 => "400x400>"},
    :url => "/imageupload/:id/:style/:basename.:extension",
    :path => ":rails_root/public/imageupload/:id/:style/:basename.:extension"
  
  validates_attachment_presence :uploaded_data
  validates_attachment_size :uploaded_data, :less_than => 1.megabytes
  
  #comply with IE image upload content types
  validates_attachment_content_type :uploaded_data, 
    :content_type => ['image/pjpeg', 'image/x-png', 'image/jpeg', 'image/png', 'image/gif']
  
  # has_attachment   :content_type => :image,
  #                    :path_prefix  => 'public/imageupload',
  #                    :processor => 'rmagick',
  #                    :storage => :file_system, 
  #                    :max_size => 1024.kilobytes, # 1MB
  #                    :resize_to => '500x500>',
  #                    :thumbnails => { :thumb100 => '100x100>', 
  #                                     :thumb200 => '200x200>', 
  #                                     :thumb300 => '300x300>',
  #                                     :thumb400 => '400x400>' }
  # 
  #   validates_as_attachment
  
  def thumbnail_size(thumb)
    if !thumb.nil?
      i = Image.find(:first, 
                     :select => "height, width", 
                     :conditions => ["parent_id = ? AND thumbnail = ?", self.id, thumb])
      
      return "#{i.width}x#{i.height}"
    end
  end
  
end
