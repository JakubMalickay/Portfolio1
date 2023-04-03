def vypocet(n1, znamenko, n2):
    if znamenko == "+":
        vysledek = n1 + n2
    elif znamenko == "-":
        vysledek = n1 - n2
    elif znamenko == "/":
        vysledek = n1 / n2
    elif znamenko == "*":
        vysledek = n1 * n2
    else:
        vysledek = "neznama operace"
    return vysledek
n1 = int(input("prvni cislo"))
znamenko = input("znamenko")
n2 = int(input("druhe cislo"))
print(vypocet(n1, znamenko, n2))

