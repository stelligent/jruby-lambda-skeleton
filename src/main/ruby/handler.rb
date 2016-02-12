(1..10).each {|x| $lambdaLogger.log(x.to_s)}

require 'aws-sdk'
s3 = Aws::S3::Client.new
list_buckets_response = s3.list_buckets
list_buckets_response.buckets.each do |bucket_name|
  $lambdaLogger.log(bucket_name)
end