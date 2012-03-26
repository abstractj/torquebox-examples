class EscreveLogService

  def initialize(args = {})
    @descricao = args['descricao']
  end

  def start 
    puts "#{@descricao} foi iniciado"
  
    queue = TorqueBox::Messaging::Queue.new '/queues/log' 
    Thread.new do 
      queue.publish "Queue #{queue.name}: Mensagem recebida pelo processor" 
    end
  end 

  def stop 
    puts "#{@descricao} foi interrompido"
  end
end
