class Usuario

  @@niveis = $dados[0]  
  @@users = $dados[1]
  @@pass = $dados[2]

  def salvar_users
    $dados[1] = @@users
    $dados[2] = @@pass
    File.open('dados.yml','w') { |x| x << $dados.to_yaml }
  end
	
  def cadastrar
    puts '--- Cadastrar ---'
    print 'Usuário: '
    user = gets.chomp
    print 'Senha: ' 
    pwd = gets.chomp

    if @@users.index(user) != nil 
      puts 'O nome de usuário ja está sendo usado.'
    else
      @@users << user
      @@pass << pwd
      @@niveis << 1
      salvar_users
      puts "O usuário #{user} foi criado com sucesso."
    end	
  end  
  
  def login
    puts '--- Login ---'
    print 'Login: '
    @usuario = gets.chomp
    @id = @@users.index(@usuario)

    if @id.nil?
      puts 'Usuario não cadastrado'
    else	
      print 'Senha: '
      @senha = gets.chomp

      if @senha == @@pass[@id]
        puts 'Login efetuado com sucesso'
	      $cont = @@niveis[@id]
	      $test = true
      else
	      puts 'Senha Invalida'
	      $cont = @@niveis[@id]
	      $test = false
      end 
    end
  end
  
  def salvar
    if @id != nil
      @@niveis[@id] = $cont
      $dados[0] = @@niveis
      $dados[1] = @@users
      $dados[2] = @@pass
      File.open('dados.yml','w') { |x| x << $dados.to_yaml }
    end
  end
  
end

