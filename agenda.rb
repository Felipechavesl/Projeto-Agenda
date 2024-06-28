
@agenda = [
  {nome: "João", telefone: "1234-5678"},
  {nome: "Maria", telefone: "1234-5678"},
]

def todos_contatos
  @agenda.each do |contato|
    puts "#{contato[:nome]} - #{contato[:telefone]}"

  end
  puts "----------------------"
end

def adicionar_contato
  puts "Digite o nome do contato:"
  nome = gets.chomp
  puts "Digite o telefone do contato:"
  telefone = gets.chomp
  @agenda << {nome: nome, telefone: telefone}
  puts "Contato adicionado com sucesso!"
  puts "----------------------"
end

def ver_contato
  puts "Qual contato você deseja ver?"
  nome= gets.chomp

  @agenda.each do |contato|
    if contato[:nome].downcase.include?(nome.downcase)
      puts "#{contato[:nome]} - #{contato[:telefone]}"
    end
    puts "----------------------"
  end

end

def editar_contato
  puts "Qual contato você deseja editar?"
  nome = gets.chomp
  @agenda.each do |contato|
    if contato[:nome].downcase.include?(nome.downcase)
      print "Nome para editar (Se quiser manter o mesmo nome, aperte enter): "
      nome_salvo = contato[:nome]

      contato[:nome] = gets.chomp
      contato[:nome] = contato[:nome].empty? ? nome_salvo : contato[:nome]

      print "Telefone para editar (Se quiser manter o mesmo telefone, aperte enter): "
      telefone_salvo = contato[:telefone]

      contato[:telefone] = gets.chomp
      contato[:telefone] = contato[:telefone].empty? ? telefone_salvo : contato[:telefone]
    end
  end
end
def remover_contato
  puts "Qual contato você deseja remover?"
  nome = gets.chomp
  @agenda.each do |contato|
    if contato[:nome].downcase.include?(nome.downcase)
    indice = @agenda.index(contato)
    @agenda.delete_at(indice)
    break
    end
  end
end
loop do
  puts "1. Contatos\n2. Adicionar Contato\n3. Ver Contato\n4. Editar Contato\n5. Deletar Contato\n0. Sair\n"

  opcao = gets.chomp.to_i
  case
  when  opcao == 0
    puts "até mais!"
    break
  when opcao == 1
    todos_contatos
  when opcao == 2
    adicionar_contato
  when opcao == 3
    ver_contato
  when opcao == 4
    editar_contato
  when opcao == 5
    remover_contato
  else
    puts "Opção inválida!"
  end
end


