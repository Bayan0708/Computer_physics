def InsertSort(x,n):
 for ipiv in range(1,n):
     xpiv = x[ipiv]
     i = ipiv-1
     while ((i>=0) and (x[i]>xpiv)):
           x[i+1]=x[i]
           i -=1
     x[i+1]=xpiv
l=[20,30,90,70,60,10,40]
print(l)
InsertSort(l,7)
print(l)
