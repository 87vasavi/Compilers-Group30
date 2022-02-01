
#inbuilt functions 

# del function 
k = "compiler"
del k
print(k)

#zip 
a = ("John", "Charles", "Mike")
b = ("Jenny", "Christy", "Monica")
x = zip(a, b)
print(tuple(x))

#sum
a = (1, 2, 3, 4, 5)
x = sum(a)
print(x)

#sorted
a = ("b", "g", "a", "d", "f", "c", "h", "e")
x = sorted(a)
print(x)


#round
x = round(5.76543, 2)
print(x)

#reversed
l=[1,2,3,4]
v=reversed(l)
print(v)

#power
x = pow(4, 3, 5)

#ord
print(ord(a))

#hex
x= hex(240)
print(x)#it prints 0xf0

#oct
x= oct(240)
print(x)

#min and max
l=[1,4,8,3]
print(min(l))
print(max(2,3)) 
print(max(l))
print(min(2,3))

#index
l=[1,1,2,4,7,6,7]
print(l.index(7)) # outputs 4

#count
l=[1,1,2,4,7,6,7]
print(l.count(7)) # outputs 2

#reverse
v=[1,5,4,3]
v.reverse()
print(v) # outputs [3,4,5,1]

def myconsFunc(a):
    return a+2

#reversed
k = ['e', 'c', 'w']
k.sort(reverse=True)
print(k) 

def myFunc(e):
    return len(e)
fruits = ["bananas","apples", "cherries","grapes"]
fruits.sort(key=myFunc)
print(fruits) 

#map   
x = map(myFunc, [1,2,3])
print(list(x))# [3,4,5]


t = (12345, 54321, 'hello!')
print(t[::-1])



#delattr
class Person:
    name="Hormonie"
    age="18"
    
delattr(Person,"age")
print(hasattr(Person,"age"))
print(getattr(Person,"age"))

c = chr(99)

v = bin(8)

#iter
x = iter(["apple", "banana", "cherry"])
print(next(x))# apple
print(next(x))# banana
print(next(x))# cherry


#identifiers 
#k = id()
counter = 100
print(id(counter))