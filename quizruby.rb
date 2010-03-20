require 'yaml'
require 'programa'
require 'questao'

def criar
  File.new('dados.yml','w')
  $dados = []
  $dados[0] = []
  $dados[1] = []
  $dados[2] = []
  File.open('dados.yml','w') { |x| x << $dados.to_yaml }
end

criar unless File.exist?('dados.yml')

$dados = YAML::load(File.open("dados.yml"))

require 'usuario'

questoes = YAML::load(File.open('questoes.yml'))

q01 = Questao.new(questoes[1][0]['pergunta'], questoes[1][0]['alternativas'], questoes[1][0]['alternativa_correta'], 1)
q02 = Questao.new(questoes[2][0]['pergunta'], questoes[2][0]['alternativas'], questoes[2][0]['alternativa_correta'], 2)
q03 = Questao.new(questoes[3][0]['pergunta'], questoes[3][0]['alternativas'], questoes[3][0]['alternativa_correta'], 3)

user = Usuario.new

quizruby = Programa.new

quizruby.titulo

opcao = nil

until opcao == 'S'
  opcao = quizruby.menu
  case (opcao)
    when 'C' : user.cadastrar
    when 'L' : user.login
    when 'D' : quizruby.limpar
  end 

  if $test != false
    if $cont == 1 then q01.perguntar end
    if $cont == 2 then q02.perguntar end
    if $cont == 3 then q03.perguntar end
    if $cont == 4 then puts 'The End =]'; Kernel::exit  end
  end

  if $error == true
    user.salvar
    $test = false
  end
end
