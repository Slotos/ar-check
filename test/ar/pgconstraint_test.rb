require "test_helper"

class PGConstraintTest < Minitest::Test
  include TestHelper

  setup do
    recreate_table
  end

  test "adds constraint" do
    with_migration do
      def up
        add_check :things, :positive_quantity, "quantity >= 0"
      end
    end.up

    error = assert_raises(ActiveRecord::StatementInvalid) do
      Thing.create(quantity: -1)
    end

    assert error.message.include?(%[new row for relation "things" violates check constraint "positive_quantity_on_things"])
  end

  test "removes constraint" do
    with_migration do
      def up
        add_check :things, :positive_quantity, "quantity >= 0"
      end

      def down
        remove_check :things, :positive_quantity
      end

      up
      down
    end

    assert Thing.create(quantity: -1).persisted?
  end

  test "dumps schema" do
    with_migration do
      def up
        add_check :things, :slug_format, "slug ~* '^[a-z0-9-]{4,20}$'"
      end
    end.up

    stream = StringIO.new
    ActiveRecord::SchemaDumper.dump(ActiveRecord::Base.connection, stream)
    contents = stream.tap(&:rewind).read

    assert contents.include?(%[add_check :things, :slug_format, "(slug)::text ~* '^[a-z0-9-]{4,20}$'::text"])
  end
end
