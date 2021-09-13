describe "Test Double" do
  it '--' do
    user = double('User')
    allow(user).to receive_messages(name: 'Jack', password: 'secret')
    puts user.name
    puts user.password
  end
end
