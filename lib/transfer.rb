# Transfer
#   initialize
#     can initialize a Transfer
#     initializes with a sender 
#     initializes with a receiver 
#     always initializes with a status of 'pending'
#     initializes with a transfer amount 
#   #valid?
#     can check that both accounts are valid 
#     calls on the sender and receiver's #valid? methods 
#   #execute_transaction
#     can execute a successful transaction between two accounts 
#     each transfer can only happen once 
#     rejects a transfer if the sender does not have enough funds (does not have a valid account) (FAILED - 19)
#   #reverse_transfer
#     can reverse a transfer between two accounts 
#     it can only reverse executed transfers 


class Transfer
  # your code here

  attr_accessor :status
  attr_reader :amount, :sender, :receiver

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
     if self.status == "pending" && sender.balance > amount && self.valid?
      sender.balance -= amount
      receiver.balance += amount
      self.status = "complete"
     else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
     end
  end

  def reverse_transfer
    if self.status == "complete" && receiver.balance > amount && self.valid?
      sender.balance += amount
      receiver.balance -= amount
      self.status = "reversed"
    else 
      self.status = "rejected"
      "Transaction rejected. Please check you account balance."
    end
  end

end
