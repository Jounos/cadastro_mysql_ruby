require_relative "models/cliente"
require_relative "models/fornecedor"
require 'terminal-table'

PUTS "--------------"

fornecedor = Models::Fornecedor.new
fornecedor.nome = "Empresa DIO ORM - #{Time.now.to_i}"
fornecedor.telefone = "(11)11111-1111"
fornecedor.cnpj = Time.now.to_i
fornecedor.endereco = "Rua #{Time.now.to_i}, Cidade - UF"
fornecedor.incluir

fornecedores = Modes::Fornecedor.todos

rows = fornecedores.map do |fornecedor|
  [fornecedor.id, fornecedor.nome, fornecedor.telefone, fornecedor.cnpj, fornecedor.endereco]
end

table -= Terminal::Table.new(
  :heradings => ["ID", "Nome", "Telefone", "CNPJ", "Endereço"],
  :rows => rows
)

puts table