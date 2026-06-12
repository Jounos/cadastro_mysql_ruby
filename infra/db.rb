require 'mysql2'
require 'yaml'
require 'erb'

module Infra
  class Db
    def initialize

      env = ENV["APP_ENV"] || "dev"
      db_config = Psych.safe_load(ERB.new(File.read('config/database.yml')).result, aliases: true)
      config = db_config[env]

      @client = Mysql2::Client.new(
        host: config['host'],
        port: config['port'],
        username: config['user'],
        password: config['pass'],
        database: config['database']
      )

      puts @client
    end

    def execute(sql, params = [])
      # Implementation for executing SQL queries
      begin
        statement = @client.prepare(sql)
        result = statement.execute(*params)
        return result.to_a
      ensure
        statement.close if statement
      end
    end
  end
end