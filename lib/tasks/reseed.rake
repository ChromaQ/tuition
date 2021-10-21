# frozen_string_literal: true

# Be very careful with this, you only want to run in prod on initial set or when you want to rebuild all data in dev
if Rails.env.development?
  namespace :db do
    desc 'Drop, create, migrate then seed the development database'
    task reseed: :environment do
      begin
        Rake::Task['environment'].invoke
        ActiveRecord::Base.connection
      rescue
        puts "Error finding database connection"
        exit 1
      else
        adapter = ActiveRecord::Base.connection.adapter_name.downcase.to_sym
        conn = ActiveRecord::Base.connection
        case adapter
        when :sqlite # When test building locally
          Rake::Task['db:drop'].invoke
          Rake::Task['db:create'].invoke
          Rake::Task['db:migrate'].invoke
          Rake::Task['db:seed'].invoke
          Rake::Task['tmp:clear'].invoke
          puts 'Reseeding completed.'
        when :sqlserver
          # This is in place, because due to DB instance permissions you can't run the command `rails db:drop`
          # => So you have to explicity have the rake task drop each one of the databases tables and than rebuild the migrations
          drop_forkey_constraints(conn)
          drop_database_tables(conn)
          Rake::Task['db:migrate'].invoke
          Rake::Task['db:seed'].invoke
          Rake::Task['tmp:clear'].invoke
          puts 'Reseeding completed.'
        end
      end
    end
  end
end

def drop_database_tables(conn)
  tables = conn.tables
  tables.each do |table|
    next if table == 'Attachments' # This is a table setup on SQLserver for the attachments FileStream

    puts "Deleting #{table}"
    conn.drop_table(table)
  end
end

def drop_forkey_constraints(conn)
  sql = <<-SQL
  while(exists(select 1 from INFORMATION_SCHEMA.TABLE_CONSTRAINTS where CONSTRAINT_TYPE='FOREIGN KEY' AND TABLE_NAME != 'Attachments'))
  begin
  	declare @sql nvarchar(2000)
  	SELECT TOP 1 @sql=('ALTER TABLE ' + TABLE_SCHEMA + '.[' + TABLE_NAME
  	+ '] DROP CONSTRAINT [' + CONSTRAINT_NAME + ']')
  	FROM information_schema.table_constraints
  	WHERE CONSTRAINT_TYPE = 'FOREIGN KEY' AND TABLE_NAME != 'Attachments'
  	exec (@sql)
  end
  SQL
  conn.execute(sql)
end
