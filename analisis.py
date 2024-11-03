import matplotlib.pyplot as plt
import numpy as np
import sys
from scipy import signal
import operator
h=10.
m1,m2=10000,100000
l=sys.argv
M=np.loadtxt(l[1])
s=l[1]
plt.figure(1)
C=M[m1:m2]
#print(len(C))
promedio2=np.mean(C[:,5])
rms=((1./(len(C)))*sum((C[:,5]-promedio2)**2))**(1/2.0)

i=M[m1:m2]

promedio=np.mean(M[:,5])
A=M[:,5]-promedio
B=A[m1:m2]/10.
f,Pxx=signal.periodogram(B)
max_index,max_value = max(enumerate(Pxx),key=operator.itemgetter(1))
w=f[max_index]   # /10.
plt.subplot(211)
plt.semilogy(f,Pxx,'k')

B=np.array(B)
#B=B[m1:m2]
B=B*B
#Calculo la integral por metodo de trapecio

A1=h/2.*(B[0]+B[-1])+h*sum(B[1:-2])
A1= A1/((m2-m1)*10.)
print ("#St Amp freq prom rms")
print (A1,w,promedio2,rms*2**(1/2.0))
#print (A1,w,promedio2,rms)
plt.subplot(212)
plt.plot(M[0:-1,0],M[0:-1,5],'b')
plt.show()
