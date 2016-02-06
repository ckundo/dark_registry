require "open-uri"

class Gift < ActiveRecord::Base
  validates :url, presence: true
  belongs_to :registry

  after_create :fetch_description

  private

  def fetch_description
    doc = Nokogiri::HTML(open(url))
    update_attributes(
      description: doc.css("#info > h3")
    )
  end

  handle_asynchronously :fetch_description
end
