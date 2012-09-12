require 'rubygems'
require 'net/ssh'

class Song < ActiveRecord::Base
  attr_accessible :file, :title, :recorded_on
  has_attached_file :file,
                    :storage => :s3,
                    :bucket => ENV['S3_BUCKET_NAME'],
                    :s3_credentials => {
                        :access_key_id => ENV['AWS_SECRET_ACCESS_KEY'],
                        :secret_access_key => ENV['AWS_ACCESS_KEY_ID']
                    }
  validates_attachment :file, :presence => true
  validates_presence_of :title
end
