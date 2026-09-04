#!/usr/bin/env ruby
# frozen_string_literal: true

def main
  if ARGV.empty?
    puts "Usage: ./my_cli_app.rb <your_name>"
    exit
  end

  name = ARGV[0]
  puts "Hello, #{name}!"
end

main if __FILE__ == $PROGRAM_NAME
