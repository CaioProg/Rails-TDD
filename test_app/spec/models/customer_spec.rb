require 'rails_helper'

RSpec.describe Customer, type: :model do

  it "#full_name - Sobrescrevendo atributo" do
    customer = create(:customer, name: "Jackson Pires" )
    customer1 = create(:customer, name: "Jackson Pires" )
    expect(customer.full_name).to eq("Sr. Jackson Pires")  
  end

  it "Herança" do
    customer = create(:customer_vip)
    expect(customer.vip).to eq(true)
  end

  it "#full_name" do
    customer = create(:user) # ou create(:customer)
    expect(customer.full_name).to start_with("Sr. ")  
  end

  it 'Usando o  attributes_for' do
    attrs = attributes_for(:customer)
    customer = Customer.create(attrs)
    expect(customer.full_name).to start_with("Sr. ")  
  end

  it 'Atributo Transitório' do
    customer = create(:customer_default, upcased: true)
    expect(customer.name.upcase).to eq(customer.name)
  end
  
  it 'Cliente Feminino ' do
    customer = create(:customer_female)
    expect(customer.gender).to eq('F')
  end

  it 'Cliente Feminino Default' do
    customer = create(:customer_female_default)
    expect(customer.gender).to eq('F')
  end

  it 'Cliente Masculino ' do
    customer = create(:customer_male)
    expect(customer.gender).to eq('M')
  end

  it 'Cliente Masculino Vip' do
    customer = create(:customer_male_vip)
    expect(customer.gender).to eq('M')
    expect(customer.vip).to eq(true)
  end

  it 'travel_to'do
    travel_to Time.new(2004, 11, 24, 01, 04, 44) do
      @customer = create(:customer_vip)
    end

    expect(@customer.created_at).to be < Time.now
  end
  
  it { expect{ create(:customer) }.to change{Customer.all.size}.by(1) }
end
  