require 'thor'
require '7d/cli/subcommands/sign'

module SevenDigital
  module CLI
    class App < Thor
      desc 'sign [ENDPOINT]', 'Generate a signed URI for a given endpoint'
      subcommand 'sign', Sign
    end
  end
end
