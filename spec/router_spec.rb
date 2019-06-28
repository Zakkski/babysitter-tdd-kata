require_relative '../lib/router.rb'

router = Router.new

describe 'run' do
  it 'should have a class of "Router"' do
    Object.const_defined?('Router')
  end

  it 'should ask which family the babysitter is working for' do
    expect{router.run}.to output("Which family are you working for tonight?\n").to_stdout
  end
end
