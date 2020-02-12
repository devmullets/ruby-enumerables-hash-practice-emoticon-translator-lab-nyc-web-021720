require 'yaml'
require 'pry'

# require 'yaml'
# thing = YAML.load_file('some.yml')
# puts thing.inspect

def load_library(file_path)
  emoticons = YAML.load(File.read(file_path))
 
  # binding.pry
  emoticons_hash = {
    :get_meaning => {}, #japanese to meaning
    :get_emoticon => {} #english to japanese emoji
  }
  
  # let's cycle thru the hash and break it down
  # emoji_def will gives us the definition
  # two_emojis is an array that we need to split out
  
  emoticons.each do |emoji_def, two_emojis| 
    
    # this spits out each emoji element in array [ english , japanese ]
  
    two_emojis.each_with_index do |single , index| 
      if index == 0 
        # we want to make a hash that is { english => japanese emoji }
        english_emoji = two_emojis[0]
        emoticons_hash[:get_emoticon][english_emoji] = two_emojis[1]
      else 
        # we want to make a hash that is { japanese_emoji => meaning
        japanese_emoji = two_emojis[1]
        emoticons_hash[:get_meaning][japanese_emoji] = emoji_def
      end 
    end
  end    
  # pp emoticons_hash
  emoticons_hash
end

def get_japanese_emoticon(file_path, japanese_emoji)
  
  emoticons_hash = load_library(file_path)
  
  puts japanese_emoji
  
  # if emoticons_hash.key?(japanese_emoji)
  #   return emoticons_hash[japanese_emoji]
  # end 
end

def get_english_meaning
  # code goes here
end