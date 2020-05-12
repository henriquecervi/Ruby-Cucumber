require "time"

task :hello do # o comando tasks, é parecido com um método em Ruby.
    puts "Hello Hake"
end

task :hello_name, [:name] do |task, args| #não estamos utilizando as tasks, mas estamos utilizando argumentos
    puts "Hello " + args[:name]
end

task :specs, [:tags] do |task, args|
    time = Time.now.utc.iso8601.tr(":", "-") # o código .tr serve para concatenação, estamos substituindo : por -
    report = "--format html --out=log/report_#{time}.html"  # o comando #{} é para acrescentar o time                                        
    sh "cucumber #{args[:tags]} #{report}"
    # sh é para rodar em shell, tags é para podermos rodar com alguma tag no shell e o report é o relatório
end