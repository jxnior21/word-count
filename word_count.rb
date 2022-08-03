=begin
Write your code for the 'Word Count' exercise in this file. Make the tests in
`word_count_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/word-count` directory.
=end


class Phrase
    def initialize(phrase)
        @phrase = phrase
    end

    # Returns a Hash of each individual word in the phrase
    # mapped to the total number of times it occurred.
    # 

    def word_count
        hash = {}
        words.each do |k, v|
            hash[k] = v.size
        end
        hash
    end

    private 

    # Replaces extra characters from the end of string and
    # commas with a space.
    #  
    # \W\s - Replaces ":" from "First: "
    # \W\W\s* - Replaces "!!&@$%^&" from "javascript!!&@$%^&"
    # \W$ - Replaces "." from "cry."
    # \, - Replaces commas
    #

    def clean_phrase
        @phrase.gsub(/\W\s|\W\W\s*|\W$|\,/, ' ')
    end

    # Returns a Hash of the phrase grouped by each 
    # individual word. 
    # 

    def words
        clean_phrase.split(' ').group_by { |x| x.downcase }
    end
end