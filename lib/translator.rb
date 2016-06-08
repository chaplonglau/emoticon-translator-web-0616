# require modules here
require 'yaml'
require 'pry'

def load_library(file_path)
  parsed = YAML.load_file(file_path)

  library = {}
  library["get_meaning"]= {}
  library["get_emoticon"]= {}
  parsed.each do |emotion, emoticon_array|
      library["get_meaning"][emoticon_array[1]] = emotion
      library["get_emoticon"][emoticon_array[0]]= emoticon_array[1]
  end
  library
end

def get_japanese_emoticon(file_path, emoticon)
  library = load_library(file_path)
  if library["get_emoticon"].has_key?(emoticon)
    library["get_emoticon"][emoticon]
  else
    "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(file_path, emoticon)
  library = load_library(file_path)
  if library["get_meaning"].has_key?(emoticon)
    library["get_meaning"][emoticon]
  else
    "Sorry, that emoticon was not found"
  end
end



