require ('rspec')
require('numbers_to_words')

describe('Fixnum#numbers_to_words')do
  it('converts one digit to written form')do
   expect(2.numbers_to_words()).to(eq('two'))
  end

  it('converts two digits to written form')do
    expect(99.numbers_to_words()).to(eq('ninety nine'))
  end

  it('converts two digits to written form if teen')do
    expect(17.numbers_to_words()).to(eq('seventeen'))
  end

  it('converts three digits to written form')do
    expect(317.numbers_to_words()).to(eq('three hundred seventeen'))
    expect(571.numbers_to_words()).to(eq('five hundred seventy one'))
  end

  it('converts four digits to written form')do
    expect(3171.numbers_to_words()).to(eq('three thousand one hundred seventy one'))
    expect(5710.numbers_to_words()).to(eq('five thousand seven hundred ten'))
  end

  it('converts five digits to written form')do
    expect(31715.numbers_to_words()).to(eq('thirty one thousand seven hundred fifteen'))
    expect(57108.numbers_to_words()).to(eq('fifty seven thousand one hundred eight'))
  end

  it('converts six digits to written form')do
    expect(317154.numbers_to_words()).to(eq('three hundred seventeen thousand one hundred fifty four'))
    expect(571080.numbers_to_words()).to(eq('five hundred seventy one thousand eighty'))
  end
end
