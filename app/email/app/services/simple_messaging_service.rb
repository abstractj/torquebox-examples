class SimpleMessagingService

  def initialize(args = {})
    @descricao = args['descricao']
  end

  def start 
    puts "#{@descricao} foi iniciado"
  
    queue = TorqueBox::Messaging::Queue.new '/queues/email' 
    Thread.new do 
      queue.publish "Queue #{queue.name}: Mensagem publicada no HornetQ com sucesso" 
      puts queue.receive( :timeout => 1000 )
    end
  end 

  def stop 
    puts "#{@descricao} foi interrompido"
  end
end
