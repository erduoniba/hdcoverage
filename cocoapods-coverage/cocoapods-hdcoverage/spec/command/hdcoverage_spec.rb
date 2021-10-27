require File.expand_path('../../spec_helper', __FILE__)

module Pod
  describe Command::Hdcoverage do
    describe 'CLAide' do
      it 'registers it self' do
        Command.parse(%w{ hdcoverage }).should.be.instance_of Command::Hdcoverage
      end
    end
  end
end

