require 'pessoa'

describe 'Atributos' do

 # before(:suite) do
 #   puts ">>>>>>> Antes de TODA a suíte de teste"
 # end
  
 # after(:suite) do
 #   puts ">>>>>>> Depois de TODA a suíte de teste"
 # end

 # before(:context) do
 # puts ">>>>>>> Antes de TODOS os testes"
 # end
  
# after(:all) do
#    puts ">>>>>>> Depois de TODOS os testes"
#  end

  around(:each) do |teste|
    puts "ANTES"
    @pessoa = Pessoa.new

    teste.run # roda o teste

    @pessoa.nome = "Sem nome!"
    puts "DEPOIS >>>>>> #{@pessoa.inspect}"
  end

  before(:each) do
    puts "ANTES"
    @pessoa = Pessoa.new
  end

  after(:each) do
    @pessoa.nome = "Sem nome!"
   puts "Depois #{@pessoa.inspect}"
  end

  it 'have_attributes' do
    @pessoa.nome = "Caio"
    @pessoa.idade = 20

    expect(@pessoa).to have_attributes(nome: a_string_starting_with("C"), idade: (a_value <= 20))  
  end

  it 'have_attributes' do
    @pessoa.nome = "Jose"
    @pessoa.idade = 20

    expect(@pessoa).to have_attributes(nome: a_string_starting_with("J"), idade: (a_value <= 20))  
  end
end
