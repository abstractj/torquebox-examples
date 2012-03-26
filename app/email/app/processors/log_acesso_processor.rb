class LogAcessoProcessor < TorqueBox::Messaging::MessageProcessor
  def on_message(body) 
    puts "Processando #{body}" 
  end 
end
