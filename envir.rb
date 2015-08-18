def get_environment
server_labels ={
    :production => "usps.com",
    :trunk => "trunk.usps.com",
    :integration => "integration.usps.com"
 }
 
  puts ((ENV['SERVER'] ||= :production).to_sym)
  env = (ENV['SERVER'] ||= :production).to_sym  #we give default value just in case...
  puts env
  puts server_labels[env]
  server_labels[env]
end

get_environment