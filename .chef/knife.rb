current_dir = File.dirname(__FILE__)
log_level                :info
log_location             STDOUT
node_name                "avas"
client_key               "#{current_dir}/avas.pem"
validation_client_name   "avas-validator"
validation_key           "#{current_dir}/avas-validator.pem"
chef_server_url          "https://api.opscode.com/organizations/avas"
cache_type               'BasicFile'
cache_options( :path => "#{ENV['HOME']}/.chef/checksums" )
cookbook_path            ["#{current_dir}/../cookbooks"]
