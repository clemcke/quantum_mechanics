require 'rubygems'
require 'net/ssh'

class Song < ActiveRecord::Base
  def self.load_songs_from_repository!
    Net::SSH.start(HOST,CREDENTIALS[:user],:password => CREDENTIALS[:password]) do |ssh|
      years = ssh.exec!("cd #{DIRECTORY} && ls").split
      years.each do |year|
        ssh.exec!("ls #{File.join(DIRECTORY,year)}").split.each do |jam|
          date = Date.new(year.to_i,jam.split('-')[1].to_i,jam.split('-')[2].to_i)
          ssh.exec!("ls #{File.join(DIRECTORY,year,jam)}").split(" ").each do |song|
            if(song =~ /mp3|m4a/)
              Song.create(:name => song.split(".").first,
                            :recorded_on => date,
                            :source_url => File.join(WEB_HOST,year,jam,song),
                           )
            end
          end
        end
      end
    end
  end
end
