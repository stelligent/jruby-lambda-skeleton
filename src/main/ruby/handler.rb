#######
## Some basic Ruby stuff
#######
(1..10).each {|x| $lambdaLogger.log(x.to_s)}

#######
## Pull in an average gem - in this case AWS-SDK
#######
require 'aws-sdk'
s3 = Aws::S3::Client.new
list_buckets_response = s3.list_buckets
list_buckets_response.buckets.each do |bucket|
  $lambdaLogger.log(bucket[:name])
end

#######
## Dump some interesting working values and call code in another Ruby file
## after tweaking the LOAD_PATH
#######
$lambdaLogger.log(Dir.entries('.').to_s)
$lambdaLogger.log $LOAD_PATH.to_s
$LOAD_PATH << 'uri:classloader:/'
require 'more_code'
$lambdaLogger.log "HEYA MATE!: #{MoreCode.new.do_some_k00l_stuff}"

#######
## Getting fancy - run rspec
#######
require 'rspec/core'
RSpec::Core::Runner.run ['spec']

