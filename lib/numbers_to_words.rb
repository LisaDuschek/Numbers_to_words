class Fixnum
  define_method(:numbers_to_words) do
    $single_digit_hash = {0 => 'zero',
                         1 => 'one',
                         2 => 'two',
                         3 => 'three',
                         4 => 'four',
                         5 => 'five',
                         6 => 'six',
                         7 => 'seven',
                         8 => 'eight',
                         9 => 'nine'}

    $double_digit_hash = {0 => $single_digit_hash,
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

    $number_string = self.to_s()
    $string_array = Array.new()

    def handle_one_digit_number()
      word = $single_digit_hash.fetch($number_string[0].to_i())
      $string_array.push(word) unless word.eql?('zero')
    end

    def treat_as_double_digit_with_type(type)
      first_word = $double_digit_hash.fetch($number_string[0].to_i())

      if $number_string[0] == '0' || $number_string[0] == '1'
        first_word = first_word.fetch($number_string[1].to_i())
        $string_array.push(first_word) unless first_word.eql?('zero')
      else
        second_word = $single_digit_hash.fetch($number_string[1].to_i())
        $string_array.push(first_word) unless first_word.eql?('zero')
        $string_array.push(second_word) unless second_word.eql?('zero')
      end
      $string_array.push(type) unless type.eql?('none') unless first_word.eql?('zero')
    end

    def treat_as_single_digit_with_type(type)
      if !$string_array.include?(type)
        first_word = $single_digit_hash.fetch($number_string[0].to_i())
        if !first_word.eql?('zero')
          second_word = type
          $string_array.push([first_word, second_word])
        end
      end
    end

    # main loop
    while $number_string.length() > 0 do

      case $number_string.length()
      when 1
        handle_one_digit_number()
      when 2
        treat_as_double_digit_with_type('none')
        break
      when 3
        treat_as_single_digit_with_type('hundred')
      when 4
        treat_as_single_digit_with_type('thousand')
      when 5
        treat_as_double_digit_with_type('thousand')
      when 6
        treat_as_single_digit_with_type('hundred')
      when 7
        treat_as_single_digit_with_type('million')
      when 8
        treat_as_double_digit_with_type('million')
      else
        # don't do anything
      end

      # chop off analyzed digit
      $number_string.replace $number_string[1..-1]
    end

    $string_array.join(' ')
  end
end
