require 'torquebox'
require 'torquebox-security'

class LoginController < ApplicationController
  def index
    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def create
    usuario = params[:usuario]
    senha = params[:senha]
    
    #Nunca faca isso em desenvolvimento, nunca :)
    puts "#{usuario} informado"
    puts "#{senha} informada"
    
    redirect_to login_path if usuario.blank? || senha.blank?
    authenticator = TorqueBox::Authentication.default
    
    if authenticator.authenticate(usuario, senha)
      puts "Autenticado com sucesso"
      redirect_to contatos_path
    else 
      mensagem = "Nao autorizado"
      redirect_to login_path
      puts mensagem
    end

  end

end
