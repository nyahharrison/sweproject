require 'rails_helper'

RSpec.describe ApplicationRecord, type: :model do
  it "is an abstract class" do
    expect(ApplicationRecord.abstract_class).to be(true)
  end

  it "is the primary abstract class" do
    expect(ApplicationRecord.primary_abstract_class).to be(true)
  end

end
