require 'fastlane_core/ui/ui'

module Fastlane
  UI = FastlaneCore::UI unless Fastlane.const_defined?("UI")

  module Helper
    class PhraseappHelper
      def self.check_phraseapp_binary
        UI.user_error!("You have to install Phraseapp CLI. https://phraseapp.com/cli") unless `which phraseapp`.to_s.length > 0
      end
    end
  end
end
