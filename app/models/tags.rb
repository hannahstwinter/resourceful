class Tags < ActiveRecord::Base
  attr_accessible :tag

  def self.process_tags(tags)
    tags.downcase.split(/\W\s*/)
  end

  def self.find_or_create(tags)
    tag_array = Array.new
    tags.each do |t|
      if Tags.find_by_tag(t).nil?
        tag_array << t
        Tags.create(:tag => t)
      else
        tag_array << t
        Tags.find_by_tag(t)
      end
    end
    return tag_array.join(",")
  end

end
