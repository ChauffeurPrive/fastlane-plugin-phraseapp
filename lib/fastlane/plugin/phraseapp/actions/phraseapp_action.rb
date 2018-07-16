require 'fastlane/action'
require_relative '../helper/phraseapp_helper'

module Fastlane
  module Actions
    class PhraseappAction < Action
      def self.run(params)
        Helper::PhraseappHelper.check_phraseapp_binary

        UI.message("PhraseApp is setup! Running binary...")

        command = [
          "cd #{File.expand_path('.').shellescape}",
          "phraseapp #{params[:command]}"
        ].join(" && ")

        Fastlane::Actions.sh_control_output(
          command,
          print_command: true,
          print_command_output: true
        )
      end

      def self.description
        "Wrapper around PhraseApp CLI Tool"
      end

      def self.authors
        ["Chauffeur Privé"]
      end

      def self.return_value
        "Exit code of the PhraseApp CLI"
      end

      def self.details
        "Allows you to control the PhraseApp CLI using Fastlane"
      end

      def self.available_options
        [
          FastlaneCore::ConfigItem.new(key: :command,
                                       env_name: "FL_PHRASEAPP_COMMAND",
                                       description: "Pass arguments to Phraseapp CLI",
                                       optional: false)
        ]
      end

      def self.is_supported?(platform)
        true
      end
    end
  end
end
