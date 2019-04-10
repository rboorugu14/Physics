import numpy as np
import matplotlib.pyplot as plt

n = int(input("Enter total number of values: "))

fr = []
l = []
for i in range(n):
    fr.append(int(input("Enter FREQUENCY: ")))
    l.append(int(input("Enter INDUCTOR: ")))

xl = []
for i in range(n):
    xl.append((2*np.pi)*fr[i]*l[i])

plt.plot(xl,fr)
plt.title("Xl vs Frequency")
plt.grid(color='red')
plt.xlabel("x axis")
plt.ylabel("y axis")
plt.xticks(np.arange(1,40))
plt.yticks(np.arange(1,40))
plt.show()

