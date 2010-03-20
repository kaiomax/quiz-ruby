class Questao
 
  def initialize (perg, alt, resp_certa, n)
    @pergunta = perg
    @alternativas = alt
    @resp_certa = resp_certa
    @nivel = n
  end
  
  def perguntar
    puts ''
    puts "***** Nível #{@nivel.to_s} *****".center(50)
    puts ''
    puts @pergunta
    i = 1
    @alternativas.each { |p|
      puts i.to_s + ' - ' + p.to_s
      i += 1
    }
    print 'Digite a opção correta: '
    resp = gets.chomp
    if resp.to_i == @resp_certa.to_i 
      puts 'Resposta Certa !'
      $cont += 1
    else
      puts 'Resposta Errada !'
      $error = true
    end
  end  
  
end
