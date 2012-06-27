require 'rubygems'
require 'net/ssh'

class Song < ActiveRecord::Base
  def self.load_songs_from_repository
    Net::SSH.start(HOST,CREDENTIALS[:user],CREDENTIALS[:password]) do |ssh|
      ssh.exec("cd #{DIRECTORY}")
      years = ssh.exec("ls").split
      puts years
    end
  end
end
