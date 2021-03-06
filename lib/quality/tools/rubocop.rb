module Quality
  module Tools
    # Adds 'rubocop' tool support to quality gem
    module Rubocop
      private

      def quality_rubocop
        ratchet_quality_cmd('rubocop',
                            gives_error_code_on_violations: true,
                            args: "--format emacs #{ruby_files}") do |line|
          self.class.count_rubocop_violations(line)
        end
      end

      def self.included(base)
        base.extend ClassMethods
      end

      # See Rubocop.included
      module ClassMethods
        def count_rubocop_violations(line)
          if line =~ /^.* file[s|] inspected, (.*) offence[s|] detected$/
            0
          else
            1
          end
        end
      end
    end
  end
end
