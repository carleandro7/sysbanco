class Account < ApplicationRecord
  has_many :saques
  has_many :depositos
  has_many :transferaccount
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :timeoutable,
         :recoverable, :rememberable, :validatable
  before_save :default_values
  validates_presence_of :nome,:cpf, :email, :telefone, :password
  validates_uniqueness_of :nome,:cpf, :email, :telefone
        
  #definir valores padrao antes de salvar  
  def default_values
    self.status = status.presence || 'Ativo'
    self.saldo = saldo.presence || "0"
  end

  def veririficar_saldo_suficiente(valor)
    if self.saldo >= valor
      return true
    end
    return false
  end

  
end
