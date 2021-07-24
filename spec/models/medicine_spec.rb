require 'rails_helper'
RSpec.describe Medicine, :type => :model do
    context ''
    it 'is not valid without a name' do
        medicine  = Medicine.new(name: 'Test', description: 'Testing Rspec')
        expect(medicine).to be_valid
    end
    it 'is not valid without a description' do
        medicine = Medicine.create(name: 'Tim')
        expect(medicine).to_not be_valid
    end
    it 'should be valid' do
        medicine = Medicine.create(name: 'Test', description: 'Testing creation of a em')
    end
end