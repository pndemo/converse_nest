require 'rails_helper'

RSpec.describe Comment, type: :model do

  it { should belong_to(:post) }

  it { should validate_presence_of(:content) }
  it { should validate_presence_of(:created_by) }
end
