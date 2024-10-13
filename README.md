# Moody
The code reproduces the Moody diagram [1] for the friction loss in a turbulent pipe flow.

# Introduction
Let's consider a steady flow of incompressible fluid in a circular pipe. Because of the viscosity, the fluid loses its pressure during the flow. The pressure loss between points A and B can be written as

$$\Delta p=\lambda \frac{l}{d}\frac{\rho u^2}{2},$$

where $l$ is the pipe length between A and B, $d$ is the pipe diameter, $\rho$ is the fluid density, and $u$ is the average velocity of the flow. 

It follows from the dimensional analysis that the pipe friction coefficient $\lambda$ is a function of $\epsilon/d$ and the Reynolds number $\mathrm{Re}=\rho u d/\mu$, where $\mu$ is the viscosity. In the luminar regime with $\mathrm{Re}<2000$, we can analytically show that $\lambda=64/\mathrm{Re}$. In the turbulent regime with $\mathrm{Re}>4000$, however, we have to use empirical formulae. In the case of a smooth pipe, there are several options.

(1) Blasius empirical correlation [e.g. 2] for $3\times10^3<\mathrm{Re}<1\times10^5$:

$$\lambda=0.3164\mathrm{Re}^{-0.25}$$

(2) Prandtl-Karman's law [e.g. 2] for $4\times10^3<\mathrm{Re}<3\times10^6$:

$$\frac{1}{\sqrt{\lambda}}=2\log_{10}(\mathrm{Re}\sqrt{\lambda})-0.8$$

In the case of a rough pipe, there is a famous formula by Colebrook.

(3) Colebrook equation [3]:

$$\frac{1}{\sqrt{\lambda}}=-2\log_{10}\left(\frac{2.51}{\mathrm{Re}\sqrt{\lambda}}+\frac{1}{3.71}\frac{\epsilon}{d}\right)$$

The solutions for the Colebrook equation can be plotted on a $\lambda-\mathrm{Re}$ plain, which is called the Moody diagram.

# What the code can do

The code calculates the Blasius correlation (1) and solves the nonlinear equations (2) and (3) with Newton's method to obtain $\lambda$. We can reproduce the Moody diagram in the turbulent regime (i.e. $\mathrm{Re}>4000$), using the solutions. The following figure is an example for the Moody diagram with $\epsilon/d=10^{-4}$, $10^{-3}$, and $10^{-2}$.

![moody](https://github.com/user-attachments/assets/dd31ce0d-77d3-42f3-83f0-c0fc95ba6211)

# Reference
[1] Moody, L. F. (1944), Transactions of the ASME, 66 (8): 671–684.

[2] 太田有・藤澤信道 (2020), 『流体の力学』, 共立出版.

[3] Colebrook, C. F. (1939), Journal of the Institution of Civil Engineers. 11 (4): 133–156.
