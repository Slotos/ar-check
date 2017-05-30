require 'bundler/setup'

require 'simplecov'
SimpleCov.start

require 'ar/pgconstraint'
require 'minitest/utils'
require 'minitest/autorun'

ActiveRecord::Base.establish_connection 'postgres:///pgconstraint-test'
ActiveRecord::Migration.verbose = false

class Thing < ActiveRecord::Base
end

module TestHelper
  def recreate_table
    ActiveRecord::Schema.define(version: 0) do
      drop_table(:things) rescue nil

      create_table :things do |t|
        t.integer :quantity, default: 0
        t.string :slug
      end
    end
  end

  if Gem::Version.create(ActiveRecord::VERSION::STRING) < Gem::Version.create('5.0.0')
    def with_migration(&block)
      Class.new(ActiveRecord::Migration, &block).new
    end
  else
    def with_migration(&block)
      Class.new(ActiveRecord::Migration[5.0], &block).new
    end
  end
end
