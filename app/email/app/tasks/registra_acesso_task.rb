class RegistraAcessoTask < TorqueBox::Messaging::Task
  def log(payload) 
    acesso = "Informação acessada #{payload[:nome]} <#{payload[:email]}> em #{Time.now}" 
    puts "#{acesso}"
  end
end
