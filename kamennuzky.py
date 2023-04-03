from random import randint
plays = ["kamen", "nuzky", "papir"]
hrac = input("kamen, nuzky, nebo papir?").lower()
souper = plays[randint(0,2)]
print(f"Souper zahral {souper}")
if souper == hrac:
    print("remiza")
elif hrac == "kamen":
    if souper == "nuzky":
        print("vyhrals")
    elif souper == "papir":
        print("prohrals")
elif hrac == "nuzky":
    if souper == "papir":
        print("vyhrals")
    elif souper == "kamen":
        print("prohrals")
elif hrac == "papir":
    if souper == "kamen":
        print("vyhrals")
    elif souper == "nuzky":
        print("prohrals")

print(".")