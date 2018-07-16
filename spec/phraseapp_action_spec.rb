describe Fastlane::Actions::PhraseappAction do
  describe '#run' do
    it 'prints a message' do
      expect(Fastlane::UI).to receive(:message).with("PhraseApp is setup! Running binary...")

      Fastlane::Actions::PhraseappAction.run(action: "command")
    end
  end
end
