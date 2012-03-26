class StatusEmailService
  def initialize(args = {})
    @descricao = args['descricao']
  end

  def start 
    puts "#{@descricao} foi iniciado"
  end 
  def stop 
    puts "#{@descricao} foi interrompido"
  end
end
