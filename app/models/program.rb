class Program < ActiveRecord::Base
    # Activity Association
    has_many :activities, dependent: :destroy
    mount_uploader :speaker_img, ImageUploader
    mount_uploader :program_img, ImageUploader
    acts_as_taggable
    accepts_nested_attributes_for :activities, allow_destroy: true
    # , reject_if: lambda {|attributes| attributes['name'].blank?}

	def self.search(tag)
	   tagged_with(tag) 
	end
end
