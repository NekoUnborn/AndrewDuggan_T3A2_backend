require 'rails_helper'
RSpec.describe Child, :type => :model do
    it('should create a new child and link it to a user') do
        child = Child.create(name: 'Alex', user_id: 2)
        expect(child).to be_a_new(Child)
    end
    it 'should not be a new medicine' do
        child = Child.create(name: 'Alex', user_id: 2)
        expect(child).not_to be_a_new(Medicine)
    end
end