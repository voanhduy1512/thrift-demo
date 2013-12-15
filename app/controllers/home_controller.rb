class HomeController < ApplicationController
  def index
    host = 'localhost'
    port = '9090'
    transport = Thrift::BufferedTransport.new(Thrift::Socket.new(host,port))
    protocol = Thrift::BinaryProtocolAccelerated.new(transport)
    client = Apache::Hadoop::Hbase::Thrift::Hbase::Client.new(protocol)
    transport.open
    desc = Apache::Hadoop::Hbase::Thrift::ColumnDescriptor.new :name => 'foo'
    tables = client.createTable('anhduy', [desc])
    transport.close

    render :text => "hello"
  end
end
