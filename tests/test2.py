#multiline comment wrong
#int literal,float literal,bool literal, complex literal, indentation





#for loop , range , 
for i in range(5):
    print(i)

#while loop
i = 0
b = 11
while(i<5 and b<22):
    i=i+1
    b+=1
    
#if-then-else,else,,range,match
n = input()
if n<=1:
    print("n<=1")
else:
    print("n>1")

print(n)
print(type(n))

#continue,break
while n > 0:              
   n = n / 2
   if n == 5:
      continue
   if n == 4 :
       break
   print ('Value :', n )

#pass

li =['e', 'a', 'i', 'o','u'] 
for i in li:
    if(i =='a'):
        pass
    else:
        print(i)

#nested loop

for i in range(1,10):
    s = 0
    for j in range(1,i+1):
        s += j 
    print(s)
