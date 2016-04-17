require './ceasar_cipher'

describe CeasarCipher do
  
  describe '#encrypt' do

    let(:cipher) { CeasarCipher.new }

    context 'when input is empty' do
      it 'returns empty string' do
        expect(cipher.encrypt('', 0)).to eql('')
      end
    end

    context 'when shift is 0' do
      it 'returns original string' do
        expect(cipher.encrypt('some test string', 0)).to eql('some test string')
      end
    end

    context 'when shift is positive' do
      it 'returns encrypted string' do
        expect(cipher.encrypt('some test string', 5)).to eql('xtrj yjxy xywnsl')
      end
    end

    context 'when shift is negative' do
      it 'returns encrypted string' do
        expect(cipher.encrypt('some test string', -3)).to eql('pljb qbpq pqofkd')
      end
    end

    context 'when input contains special characters' do
      it 'persists special characters' do
        expect(cipher.encrypt('this_is-some(test!)', 7)).to eql('aopz_pz-zvtl(alza!)')
      end
    end

    context 'when input contains uppercase characters' do
      it 'persists uppercase characters' do
        expect(cipher.encrypt('This is Some Test', 2)).to eql('Vjku ku Uqog Vguv')
      end
    end

  end

end
