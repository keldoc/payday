# frozen_string_literal: true

require 'tmpdir'
require 'fileutils'

SPEC_TMP_DIR = File.join(Dir.tmpdir, 'payday-spec')
FileUtils.mkdir_p(SPEC_TMP_DIR)

require_relative '../lib/payday'

# Requires supporting ruby files with custom matchers and macros, etc, in
# spec/support/ and its subdirectories.
Dir['spec/support/**/*.rb'].each { |f| require f[5..] }

RSpec.configure do |_config|
  # some (optional) config here
end
