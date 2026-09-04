require 'pstore'

class DB
  def initialize(file_path)
    @store = PStore.new(file_path)
  end
end