require 'json'

# Check if a string is a number, vaidating if it does not contain a caracter different to a number
# Parameter:
# - String to validate
# Return:
# - True: if the strin is a number
# - False: otherwise
def number?(value)
  begin
    result = /\D+/.match(value.to_s).nil?
  rescue Exception => e
    result = false
  end
  result
end

# This method check if a given value is alphanumeric
# Parameter
# => value: value to check
# Return
# => true: if the given value is alphanumeric
# => false: otherwise
def alphanumeric?(value)
  valid = [*?a..?z, *?A..?Z, *'0'..'9']
  value.chars.detect {|ch| !valid.include?(ch)}.nil?
end

# This method check if a given value is boolean
# Parameter
# => value: value to check
# Return
# => true: if the given value is boolean
# => false: otherwise
def boolean?(value)
  valid = ["true", "false", true, false]
  valid.include? value
end

# This method check if a given value is a timestamp
# Parameter
# => value: value to check
# Return
# => true: if the given value is a timestamp
# => false: otherwise
def timestamp?(value)
  regex = /([0-9]{4})-([0-9]{1,2})-([0-9]{1,2})T([0-9]{1,2}):([0-9]{1,2}):([0-9]{1,2})(\.?)([0-9]{1,10}?)Z/
  !regex.match(value).nil?
end

# This method reads a JSON file
# Parameter
# => file_name: JSON filename to read
# Return
# => data_hash: All information of the JSON file
def read_json(file_name)
  file = File.read(file_name)
  data_hash = JSON.parse(file)
end

# Example:
# data_hash['title']
# => "Ruby In Rails"
# data_hash.keys
# => ["title", "url", "posts"]
# data_hash['posts']
# => { "1" => "strftime-time-format-in-ruby", "2" => "what-is-gemset" }
#
#