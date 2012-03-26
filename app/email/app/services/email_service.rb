class EmailService

  include TorqueBox::Injectors
  
  def initialize
    @service = inject( Java::br.com.mundoj.EmailService )
  end

  def notificar(mensagem)
    @service.enviar(mensagem)
  end

end
