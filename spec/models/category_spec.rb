
require 'rails_helper'

RSpec.describe Category do
    it { expect(described_class.new).to validate_presence_of :name }
    it { expect(described_class.new).to validate_presence_of :description } 
end