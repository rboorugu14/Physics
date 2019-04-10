import numpy as np
import matplotlib.pyplot as plt

n = int(input("Enter total number of values: "))

fr = []
c = []
for i in range(n):
    fr.append(int(input("Enter FREQUENCY: ")))
    c.append(int(input("Enter CONDUCTOR: ")))

xc = []
for i in range(n):
    xc.append((2*np.pi)*fr[i]*c[i])

plt.plot(xc,fr)
plt.title("Xl vs Frequency")
plt.grid(color='red')
plt.xlabel("x axis")
plt.ylabel("y axis")
plt.xticks(np.arange(1,40))
plt.yticks(np.arange(1,40))
plt.show()
