class Refeicao
  # atributos que atribuem setters e getters automaticamente a esses simbolos
  attr_accessor :nome_pedido, :tipo, :descricao, :preco, :disponibilidade
  @@refeicao_vendidas = 0
  @@soma_vendas = 0

  # Inicializando o pedido
  def initialize(pedido)
    @nome_pedido = pedido[:nome_pedido]
    @tipo = pedido[:tipo]
    @descricao = pedido[:descricao]
    @preco = pedido[:preco]
    check_disponivel(pedido)
    @disponibilidade = pedido[:disponibilidade]
  end

  # Checa se o pedido ta disponivel
  def check_disponivel(pedido)
    if pedido[:disponibilidade] == "Disponivel"
      @@refeicao_vendidas += 1
      @@soma_vendas += pedido[:preco]
      "Disponivel"
    else
      "Indisponivel"
    end
  end

  # Getter que retorna a soma total das vendas
  def self.soma_vendas
    "R$ #{'%.2f' % @@soma_vendas}"
  end

  # Getter das refeicoes vendidas
  def self.refeicao_vendidas
    @@refeicao_vendidas
  end
  # Printando os pedidos feitos
  def print_info(pedido)
    puts pedido
  end
  
end

class Carrinho

attr_accessor :nome_prato, :preco_prato
  # Inicializando o carrinho
  def initialize
    @carrinho = Array.new
  end
  
  # Adicionando os itens no carrinho via hash
  def add_carrinho(info)
    @nome_prato = info[:nome_prato]
    @preco_prato = info[:preco_prato]
    
    if @carrinho.empty? || @carrinho.include?(info) == false
      @carrinho << info 
    elsif @nome_prato.include?(info[:nome_prato])
      info[:quantidade] += 1
      info[:preco_prato] += @preco_prato
    end
  end

  # Printando o carrinho
  def print_carrinho
    @carrinho.each_index do |index|
      puts "#{@carrinho[index][:nome_prato]}: #{@carrinho[index][:quantidade]}, total: R$ #{'%.2f' % @carrinho[index][:preco_prato]}"
    end
  end

end

pedido1 = {nome_pedido: "macarrao", tipo: "massa", descricao: "top", preco: 24.90, disponibilidade: "Disponivel"}
carrinho1 = {nome_prato: pedido1[:nome_pedido], quantidade: 1, preco_prato: pedido1[:preco]}

pedido2 = {nome_pedido: "bife a parmagiana", tipo: "massa", descricao: "coisinha", preco: 45.90, disponibilidade: "Disponivel"}
carrinho2 = {nome_prato: pedido2[:nome_pedido], quantidade: 1, preco_prato: pedido2[:preco]}

ref1 = Refeicao.new(pedido1)

car1 = Carrinho.new

car1.add_carrinho(carrinho1)
car1.add_carrinho(carrinho1)
car1.add_carrinho(carrinho1)
car1.add_carrinho(carrinho2)


car1.print_carrinho