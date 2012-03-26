class EmailJob
  def initialize(config={})
    puts "Job iniciado #{Time.now} config #{config['enviar']}"
  end

  def run
    puts "Job executado #{Time.now}"
  end
end
