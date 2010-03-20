class Programa

  def titulo
    puts '
   ____         _         ___         _  
  / __ \       (_)       |    \      | | 
 / /  \ \ _   _ _ _____  | ()  )_   _| |__ _    __
( (    ) ) | | | |\_  /  |    /| | | | /  \ \  / /
 \ \_\/ /| \_/ | | / /_  |  \  \ \_/ |  () ) \/ /
  \___\/  \___/|_|/____\ |___\__\___/ \ __/ \  /
       \                                    / / 
                                           /_/
'
  end

  def menu
    puts '	
	#################################
	#            - Menu -		#
	#				#
	# [C] - Cadastrar novo usuário	#
	# [L] - Login			#
	# [D] - Limpar dados		#
	# [S] - Sair			#
	#				#
	#################################'
    print 'Digite a opção desejada:'
    opcao = gets.chomp.capitalize

    if opcao != 'C' && opcao != 'L' && opcao != 'S' && opcao != 'D'
      puts 'Opção Inválida'
      menu
    else
      opcao
    end
  end 

  def limpar
    $dados[0] = []
    $dados[1] = []
    $dados[2] = []
    File.open('dados.yml','w') { |x| x << $dados.to_yaml }
    puts 'Dados excluídos'
    Kernel::exit
  end	

end
