# frozen_string_literal: true

require 'test_helper'

class MiniSql::Oracle::TestBuilder < MiniTest::Test
  def setup
    @connection = oracle_connection
  end

  include MiniSql::BuilderTests
end
