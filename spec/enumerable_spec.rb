require './enumerable'

describe Enumerable do

  describe '.my_each' do

    context 'when used on non-empty array' do
      it 'iterates all elements' do
        output = []
        (1..5).to_a.my_each { |e| output << e }
        expect(output).to eql((1..5).to_a)
      end
    end

    context 'when used on empty array' do
      it 'does not iterate' do
        [].my_each { fail }
      end
    end
  end

  describe '.my_each_with_index' do

    context 'when used on non-empty array' do
      it 'yields proper item-index pairs' do
        hash = {}
        %w{a b c}.my_each_with_index { |e, i| hash[e.to_sym] = i }
        expect(hash.size).to eql(3)
        expect(hash).to eql({a: 0, b: 1, c:2})
      end
    end

    context 'when used on empty array' do
      it 'does not yield' do
        [].my_each_with_index { fail }
      end
    end
  end

  describe '.my_select' do

    context 'when used on non-empty array' do
      it 'returns selected objects' do
        selected = (1..5).to_a.my_select { |num| num <= 3 }
        expect(selected).to eql((1..3).to_a)
      end
    end

    context 'when used on range' do
      it 'returns selected object' do
        selected = (1..7).my_select { |num| num <= 5 }
        expect(selected).to eql((1..5).to_a)
      end
    end
  end

  describe '.my_all?' do

    context 'when used on non-empty array' do
      it 'returns false properly' do
        result = (1..5).to_a.my_all? { |e| e < 5 }
        expect(result).to be_falsey
      end
      it 'returns true properly' do
        result = (1..5).to_a.my_all? { |e| e < 6 }
        expect(result).to be_truthy
      end
    end
  end

  describe '.my_none?' do

    context 'when used on non-empty array' do
      it 'returns false properly' do
        result = (1..5).to_a.my_none? { |e| e > 4 }
        expect(result).to be_falsey
      end
      it 'returns true properly' do
        result = (1..5).to_a.my_none? { |e| e > 6 }
        expect(result).to be_truthy
      end
    end

    context 'when used on empty array' do
      it 'returns true' do
        result = [].none? { |e| true }
        expect(result).to be_truthy
      end
    end
  end

  describe '.my_map' do

    context 'when used on empty array' do
      it 'returns empty array' do
        result = [].my_map { |e| fail }
        expect(result).to eql([])
      end
    end

    context 'when used on non-empty array' do
      it 'returns mapped objects' do
        result = (1..5).to_a.my_map { |e| e * 2 }
        expect(result).to eql([2, 4, 6, 8, 10])
      end
    end
  end


end
