require 'socksify/http'
require "open-uri"

class Gift < ActiveRecord::Base
  validates :url, presence: true
  belongs_to :registry

  after_create :fetch_description

  private

  def fetch_description
    uri = URI.parse(url)
    Net::HTTP.SOCKSProxy('127.0.0.1', 9050).start(uri.host, uri.port) do |http|
      res = http.get(uri.path)
      doc = Nokogiri::HTML(res)
      update_attributes(
        description: doc.css("#info > h3")
      )
    end
  end
end
