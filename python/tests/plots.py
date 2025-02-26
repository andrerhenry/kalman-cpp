import matplotlib.pyplot as plt
import pandas as pd
import numpy as np

data = pd.read_csv("data/DataOutput.csv")
t = data["t"]
y = data["y"]

x_hat = data["x_hat"]
x_hat = x_hat.str.split(expand=True).astype(float)

plt.plot(t, y, marker='o', linestyle='-', label="Measured Data")
plt.plot(t, x_hat[0], marker='s', linestyle='--', label="x_hat (Corrected Data)")

plt.xlabel("Time (t)")
plt.ylabel("Position (x)")
plt.title("Kalman Filter Test: Measured vs. Corrected Data")
plt.legend()
plt.show()