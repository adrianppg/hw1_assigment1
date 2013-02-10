### Part III - anagrams

def combine_anagrams(words)
  hash_anagrams=Hash.new
  groups_anagram=Array.new
  words.each do |candidate|
    anagram = candidate.downcase.chars.sort.join
    if hash_anagrams.has_key? anagram
      index_of_anagram_group = hash_anagrams[anagram]
      groups_anagram[index_of_anagram_group].push(candidate)
    else
      groups_anagram.push [candidate]
      hash_anagrams[anagram]=groups_anagram.length-1          
    end      
  end
  return groups_anagram
end
