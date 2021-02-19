# frozen_string_literal: true

# we need this for a coder
require "bigdecimal"

require_relative "mini_sql/version"
require_relative "mini_sql/connection"
require_relative "mini_sql/deserializer_cache"
require_relative "mini_sql/builder"
require_relative "mini_sql/inline_param_encoder"
require_relative "mini_sql/decoratable"
require_relative "mini_sql/serializer"
require_relative "mini_sql/result"

module MiniSql
  if RUBY_ENGINE == 'jruby'
    module Postgres
      autoload :Connection, "mini_sql/postgres_jdbc/connection"
      autoload :DeserializerCache, "mini_sql/postgres_jdbc/deserializer_cache"
    end
  else
    module Postgres
      autoload :Coders, "mini_sql/postgres/coders"
      autoload :Connection, "mini_sql/postgres/connection"
      autoload :DeserializerCache, "mini_sql/postgres/deserializer_cache"
    end

    module ActiveRecordPostgres
      autoload :Connection, "mini_sql/active_record_postgres/connection"
    end

    module Sqlite
      autoload :Connection, "mini_sql/sqlite/connection"
      autoload :DeserializerCache, "mini_sql/sqlite/deserializer_cache"
    end

    module Mysql
      autoload :Connection, "mini_sql/mysql/connection"
      autoload :DeserializerCache, "mini_sql/mysql/deserializer_cache"
    end
  end
end
