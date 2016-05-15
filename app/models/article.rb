class Article < ActiveRecord::Base
  has_many :comments
  has_many :taggings
  has_many :tags, through: :taggings
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }

  # This is part of the paperclip library and that there are columns to
  # store that info in the database that start with "image_"
  # You must include a validator for paperclip or explicity state that it shouldn't
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]

  def tag_list
    self.tags.collect do | tag |
      tag.name
    end.join(", ")
  end

  def tag_list=(tags_string)
    tag_names = tags_string.split(",").collect { | s | s.strip.downcase}.uniq
    new_or_found_tags = tag_names.collect do | name |
      Tag.find_or_create_by(name: name)
    end
    self.tags = new_or_found_tags
  end



end
