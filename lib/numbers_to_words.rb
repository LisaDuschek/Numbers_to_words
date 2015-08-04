class Fixnum
  define_method(:numbers_to_words) do
    single_digit_hash = {0 => 'zero',
                         1 => 'one',
                         2 => 'two',
                         3 => 'three',
                         4 => 'four',
                         5 => 'five',
                         6 => 'six',
                         7 => 'seven',
                         8 => 'eight',
                         9 => 'nine'}

    double_digit_hash = {0 => single_digit_hash,
                         1 => {0 => 'ten',
                               1 => 'eleven',
                               2 => 'twelve',
                               3 => 'thirteen',
                               4 => 'fourteen',
                               5 => 'fifteen',
                               6 => 'sixteen',
                               7 => 'seventeen',
                               8 => 'eighteen',
                               9 => 'nineteen'},
                         2 => 'twenty',
                         3 => 'thirty',
                         4 => 'forty',
                         5 => 'fifty',
                         6 => 'sixty',
                         7 => 'seventy',
                         8 => 'eighty',
                         9 => 'ninety'}

    number_string = self.to_s()
    string_array = Array.new()

    while number_string.length() > 0 do
      # do stuff
      puts "number_string = #{number_string}"
      puts "string_array = #{string_array}"
      case number_string.length()
      when 1
        string_array.push(single_digit_hash.fetch(number_string[0].to_i()))
      when 2
        first_word = double_digit_hash.fetch(number_string[0].to_i())

        if number_string[0] == '0' || number_string[0] == '1' # do not need to fetch second word
          first_word = first_word.fetch(number_string[1].to_i())
          string_array.push(first_word)
        else  # need to fetch second word
          string_array.push(first_word)
          string_array.push(single_digit_hash.fetch(number_string[1].to_i()))
        end
        break
      when 3
        first_word = single_digit_hash.fetch(number_string[0].to_i())
        second_word = "hundred"
        string_array.push([first_word, second_word])
      when 4
        if !string_array.include?("thousand")
          first_word = single_digit_hash.fetch(number_string[0].to_i())
          second_word = "thousand"
          string_array.push([first_word, second_word])
        end
      when 5
        # TODO: remove duplication
        first_word = double_digit_hash.fetch(number_string[0].to_i())

        if number_string[0] == '1' # do not need to fetch second word
          first_word = first_word.fetch(number_string[1].to_i())
          string_array.push(first_word)
        else  # need to fetch second word
          string_array.push(first_word)
          string_array.push(single_digit_hash.fetch(number_string[1].to_i()))
        end
        string_array.push("thousand")
      else
        # don't do anything
      end

      # chop off analyzed digit
      number_string.replace number_string[1..-1]
    end

    string_array.join(' ')
  end
end
