## withdraw
def withdraw():
    print("Withdrawal Service")
    amount = input("Please input the amount: ")
    print(f"{amount} baht was withdrawn from your account.")
    print("Thank you for using our service.")

## deposit
def deposit():
    print("Deposit Service")
    amount = input("Please input the amount: ")
    print(f"{amount} baht was deposited to your account")
    print("Thank you for using our service.")


## transfer
def transfer():
    print("Transfer Service")
    bank = input("Transfer to: ")
    amount= input("Please input the amout: ")
    print(f"{amount} baht has been transferred to {bank}.")
    print("Thank you for using our service.")

## Pay a bill
def pay_bill():
    print("Bill Payment Service")
    receiver = input("Pay a bill to: ")
    amount = input("Please input the amout: ")
    print(f"{amount} baht was paid to {receiver}.")
    print("Thank you for using our service.")
    
## class ATM
class ATM:
    def __init__(self, name, bank):
        self.name = name
        self.bank = bank

    def service(self):
        print("""What service do you need?
        Withdrawals:  Type 1
        Deposit:      Type 2
        Transfer:     Type 3
        Pay the bill: Type 4
        Quit:         Type 5
        """)
        user_need = int(input("Please type your service: " ))

        while True:
            if user_need == 1:
                withdraw()            
            
            elif user_need == 2:
                deposit()              

            elif user_need == 3:
                transfer()          

            elif user_need == 4:
                pay_bill() 
            
            elif user_need == 5:
                print("See you again. Thank you.") 

            else:
                print("Your service is invalid. Please try again.")
                break

## create instance
atm1 = ATM("Marry Jane", "SCB")
atm2 = ATM("Peter Parker", "BAY")

## run method
atm1.service()
