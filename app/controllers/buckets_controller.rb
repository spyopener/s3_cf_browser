class BucketsController < ApplicationController
  def index
    s3 ||=  Aws::S3::Client.new
    @buckets = s3.list_buckets.buckets.map(&:name) 
  end

  def show
    @distribution_alias = params[:distribution_alias]
    @bucket = params[:id]
    delimiter = params[:delimiter] || '/'
    prefix = params[:prefix] || nil

    s3 ||=  Aws::S3::Client.new
	resp = s3.list_objects(bucket: @bucket, delimiter: delimiter, prefix: prefix, max_keys: 500000)
	@prefixes = resp.common_prefixes.map(&:prefix)
	@keys = resp.contents.sort!{| a, b | b[:last_modified] <=> a[:last_modified] }.map(&:key) - [ prefix ] 
  end
end
