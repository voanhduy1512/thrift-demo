class HomeController < ApplicationController
  def index
    host = 'localhost'
    port = '9090'
    conn = MassiveRecord::Wrapper::Connection.new(:host => host, :port => port)
    conn.open
    tables = conn.tables
    
    table = MassiveRecord::Wrapper::Table.new(conn, tables[0])
    table_name = table.name
    column_family_names = table.fetch_column_family_names
    conn.close
    render :text => {:table => table_name, :column_family_names => column_family_names}
  end
end
