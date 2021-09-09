require 'calculator'

describe Calculator, "Sobre a Caluculadora" do

  context '#sum' do      
    it 'with positive numbers' do
      result = subject.sum(5, 7)
      expect(result).to eq(12)  
    end

    it 'with negative and positive numbers' do
      result = subject.sum(-5, 7)
      expect(result).to eq(2) 
    end

    it 'with negative numbers' do
      result = subject.sum(-5, 5)
      expect(result).to eq(0)  
    end
  end
end
