def j(j,i,n):
    j[n] -=i
def f(j):
    return all(x==0 for x in j)
def mj(j):
    ni=0
    for n in j: ni^=n
    if ni:
        c=next(n for n in range(len(j))if j[n]&(1<<(ni.bit_length()-1)))
        return j[c]-(ni^j[c]),c
    return 1,next(n for n in range(len(j)) if j[n])
def m():
    j,p=[3,4,2,3,2,2,2],int(input())
    while not f(j):
        if p:
            n=int(input())-1
            i=int(input())
            if 0 <= n < len(j) and 0<i<=j[n]:
                j(j, i, n)
                p=0
        else:
            mo=mj(j)
            j(j,mo[0],mo[1])
            p=1
            print(j)
m()