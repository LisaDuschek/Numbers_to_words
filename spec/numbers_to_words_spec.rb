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
end
