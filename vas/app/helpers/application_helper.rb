module ApplicationHelper  
  def broadcast(channel, &block)  
    message = {:channel => channel, :data => capture(&block)}  
    uri = URI.parse("http://localhost:9292/faye")  
    Net::HTTP.post_form(uri, :message => message.to_json)  
  end  
  def check?
    Incoming.last.exten_number = '4101'
  end
end 
