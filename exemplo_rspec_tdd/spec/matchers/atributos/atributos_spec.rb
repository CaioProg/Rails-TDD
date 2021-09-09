require 'pessoa'

describe 'Atributos' do
  it 'have_attributes' do
    pessoa = Pessoa.new
    pessoa.nome = "Caio"
    pessoa.idade = 20

    expect(pessoa).to have_attributes(nome: a_string_starting_with("C"), idade: (a_value <= 20))  
  end
end
