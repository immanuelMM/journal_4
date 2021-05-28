require 'rails_helper'

RSpec.describe User do
    it { expect(described_class.new).to validate_presence_of :username}
    it { expect(described_class.new).to validate_presence_of :password}
end