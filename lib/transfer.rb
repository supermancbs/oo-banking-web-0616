class Transfer
  # your code here
  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender=sender
    @receiver = receiver
    @status ='pending'
    @amount = amount
  end 

  def valid?
    self.receiver.valid? && self.sender.valid?
  end 

  def execute_transaction
    if self.valid? &&  @status=='pending' && @amount < self.sender.balance
      self.receiver.balance+=@amount
      self.sender.balance-=@amount
       @status="complete"
    else 
      @status="rejected"
      "Transaction rejected. Please check your account balance."
    end
  end 

  def reverse_transfer
    if @status=="complete"
      self.receiver.balance-=@amount
      self.sender.balance+=@amount
      @status ="reversed"
    end

  end 

end
