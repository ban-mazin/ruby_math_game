class Question
 attr_accessor :result, :questioin
 def initialize 
  randNum1 = rand(1..10)
  randNum2 = rand(1..10)
  @question = "What is #{randNum1} + #{randNum2} ?"
  @result = randNum1 + randNum2
 end


end