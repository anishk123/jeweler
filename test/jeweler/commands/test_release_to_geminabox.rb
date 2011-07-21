require 'test_helper'

class Jeweler
  module Commands
    class TestReleaseToGeminabox < Test::Unit::TestCase
      def self.subject
        Jeweler::Commands::ReleaseToGeminabox.new
      end

      geminabox_command_context "gem is present and gemspec defined" do
        setup do
          stub(@command).system { true }
          @command.run
        end

        should "push to geminabox" do
          push_command = "gem inabox #{File.join(@base_dir, 'pkg', @gemspec.file_name)}"
          assert_received(@command) { |command| command.system(push_command) }
        end
      end

      build_command_context "building from jeweler" do
        setup do
          @command = Jeweler::Commands::ReleaseToGeminabox.build_for(@jeweler)
        end

        should "assign gemspec_helper" do
          assert_same @gemspec_helper, @command.gemspec_helper
        end

        should "assign base_dir" do
          assert_same @base_dir, @command.base_dir
        end
      end
      
    end
  end
end
