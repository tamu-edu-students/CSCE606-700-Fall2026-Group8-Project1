#!/usr/bin/env ruby
# frozen_string_literal: true
require_relative "classes/db"
require_relative "classes/service"
require_relative "classes/cli"

def main
  db = DB.new("items.pstore")
  service = Service.new(db)
  cli = Cli.new(service)
end

main if __FILE__ == $PROGRAM_NAME
