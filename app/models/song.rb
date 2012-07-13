require 'rubygems'
require 'net/ssh'

class Song < ActiveRecord::Base
  attr_accessible :file
  has_attached_file :file,
                    :storage => :s3,
                    :bucket => ENV['S3_BUCKET_NAME'],
                    :s3_credentials => {
                        :access_key_id => ENV['S3_KEY'],
                        :secret_access_key => ENV['S3_SECRET']
                    }
end
