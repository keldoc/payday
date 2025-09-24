# frozen_string_literal: true

require 'fileutils'

# Usage: expect(renderer.render).to match_binary_asset('pdf/test.pdf')
RSpec::Matchers.define(:match_binary_asset) do |file_name|
  match do |actual_output|
    expected_names = Array(file_name)
    expected_paths = expected_names.map { |name| File.join('spec/assets', name) }
    expected_outputs = expected_paths.map { |path| File.binread(path) }

    expected_outputs.any? { |expected| actual_output == expected }.tap do |result|
      unless result
        output_name = expected_names.first
        output_path = File.join(SPEC_TMP_DIR, 'rendered_output', output_name)

        FileUtils.mkdir_p(File.dirname(output_path))
        File.open(output_path, 'wb') { |f| f.write actual_output }
      end
    end
  end

  failure_message do |_actual_output|
    expected_names = Array(file_name)
    expected_paths = expected_names.map { |name| File.join('spec/assets', name) }
    output_name = expected_names.first
    actual_output_path = File.join(SPEC_TMP_DIR, 'rendered_output', output_name)

    "expected output to match one of #{expected_paths} "\
      "(see #{actual_output_path})"
  end
end
