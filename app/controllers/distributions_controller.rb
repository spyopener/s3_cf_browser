class DistributionsController < ApplicationController
  def index
    cloudfront ||=  Aws::CloudFront::Client.new
    @distributions = [] 
    cloudfront.list_distributions.distribution_list.items.each do |e|
      @distributions << { 
        id: e.id, 
	aliases: e.aliases.items, 
	bucket: e.origins.items.first.domain_name.split('.s3.amazonaws.com') }
    end
  end

end
