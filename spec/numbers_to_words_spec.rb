require ('rspec')
require('numbers_to_words')

describe('Fixnum#numbers_to_words')do
   it('converts one digit to written form')do
     expect(2.numbers_to_words()).to(eq('two'))
 end
end
