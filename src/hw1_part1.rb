### Part I - fun with strings
#require 'test/unit'

def ignore_special_characters(string)
  string = ignore_special_characters_at_first(string)
  # delete non-word characters [/\W/ non-word characters]
  string = string.gsub(/\W/,'')  
end

def ignore_special_characters_at_first(string)
  # delete non-word characters [/\W/ non-word characters]
  string = string.downcase
  string = string.gsub(/[[:punct:]]/,'')
end

def palindrome?(string)
  string = ignore_special_characters(string)
  if ((string).match(string.reverse))
    return true
  else
    return false
  end  
end

def count_words(string)
  hashwords={}
  string=ignore_special_characters_at_first(string)
  words = string.split
  
  words.each do |word|
    if !hashwords.has_key?(word)
      hashwords[word]=0
    end
    hashwords[word]=hashwords[word]+1
  end
  return hashwords
end
