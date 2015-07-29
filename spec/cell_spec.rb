require 'cell'

describe Cell do
  it "can have content" do
    expect(subject).to respond_to(:add_content)
  end
end
