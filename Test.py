#sum is grtesr than 100 do not print
#Decorator

def add(a,b):
    sum=a+b
    if (sum<100):
        return (sum)
    else:
        pass



def subtract(a,b):
    subtraction=a-b
    if (subtraction<100):
        return (subtraction)
    
    else:
        pass


#print(add(-20,-10))
string="Sujit's Test"
print(f"{string}"+str(subtract(200,150)))



"""
Cases-
1. (10,6)
2. (-18,50))
3(18,-50)
4(-18,-50)
5(50,55)
6(-50,55)
8()
7(-50-55)


UI Cases-
1.input Field are taking numbers correctly by geting getvalue method
2.what if alphbates are inserted in input field
3.Negative number inputs
4.What if blank inputs are given--->> directly click on sum button
5 Can test for floating values


API Cases-
1 Response code for positive case should be 200

2 Response body in case on positive inputs
3 Response body in case on negative inputs(blank/ alphabates)
4 input in case of float values
5 wrong certificate (unauthorized user)


"""