class BucketsController < ApplicationController
  def index
    s3 ||=  Aws::S3::Client.new
    @buckets = s3.list_buckets.buckets.map(&:name) 
  end
end
