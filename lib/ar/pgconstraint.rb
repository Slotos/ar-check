require "active_support/all"
require "active_record"
require "active_record/connection_adapters/postgresql_adapter"
require "active_record/migration/command_recorder"
require "active_record/schema_dumper"
require "ar/pgconstraint/version"

module AR
  module PGConstraint
    require "ar/pgconstraint/command_recorder"
    require "ar/pgconstraint/adapter"
    require "ar/pgconstraint/schema_dumper"
  end
end

ActiveRecord::Migration::CommandRecorder.include AR::PGConstraint::CommandRecorder
ActiveRecord::ConnectionAdapters::PostgreSQLAdapter.include AR::PGConstraint::Adapter
ActiveRecord::SchemaDumper.prepend AR::PGConstraint::SchemaDumper
