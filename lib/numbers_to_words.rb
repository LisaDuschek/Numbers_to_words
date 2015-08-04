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

    double_digit_hash = {1 => {0 => 'ten',
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
    number_length = number_string.length()

    # number_string.each_char() do |char|
    #   index_of_char = number_string.index(char)
    #
    #   puts "char: #{char} at index: #{index_of_char}"
    # end

    string_array = Array.new()
    if number_length == 1
      string_array.push(single_digit_hash.fetch(self))
    elsif number_length == 2
      first_char = double_digit_hash.fetch(number_string[0].to_i())

      if number_string[0] == '1' # do not need to fetch second char
        first_char = first_char.fetch(number_string[1].to_i())
        string_array.push(first_char)
      else  # need to fetch second char
        string_array.push(first_char)
        string_array.push(single_digit_hash.fetch(number_string[1].to_i()))
      end

    end
    string_array.join(' ')

  end
end
