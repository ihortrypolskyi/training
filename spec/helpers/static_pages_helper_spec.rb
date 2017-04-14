require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the StaticPagesHelper. For example:
#
# describe StaticPagesHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe StaticPagesHelper, type: :helper do
  describe ApplicationHelper do
    describe 'fool_title' do
      it 'should include the page title' do
        expect(full_title('foo')).to match(/foo/)
      end

      it 'should include the base title' do
        expect(full_title('foo')).to match(/^My training site -/)
      end

      it "should not include a bar for the home page" do
        expect(full_title("")).not_to match(/\|/)
      end


    end
  end
  # pending "add some examples to (or delete) #{__FILE__}"
end
