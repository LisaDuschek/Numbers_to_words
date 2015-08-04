class Fixnum
  define_method(:numbers_to_words) do
    digit_hash = {0 => 'zero',
                  1 => 'one',
                  2 => 'two',
                  3 => 'three',
                  4 => 'four',
                  5 => 'five',
                  6 => 'six',
                  7 => 'seven',
                  8 => 'eight',
                  9 => 'nine'}

                        #  10 => 'ten',
                        #  11 => 'eleven',
                        #  12 => 'twelve',
                        #  13 => 'thirteen',
                        #  14 => 'fourteen',
                        #  15 => 'fifteen',
                        #  16 => 'sixteen',
                        #  17 => 'seventeen',
                        #  18 => 'eighteen',
                        #  19 => 'nineteen',
                        #  20 => 'twenty',
                        #  30 => 'thirty',
                        #  40 => 'forty',
                        #  50 => 'fifty',
                        #  60 => 'sixty'
                        #  }

    # length_hash = {1 => single_digit_hash,
    #                2 => double_digit_hash}

    # 10 = ten
    # 15 = fifteen
    # 20 = twenty
    # 145 = One Hundred Forty Five
    #self.split().each() do |digit|

    digit_hash.fetch(self)

  end
end
