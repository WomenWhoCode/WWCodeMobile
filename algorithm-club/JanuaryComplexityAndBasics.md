<h1>January</h1>

<h3> Week 1: Big O Complexity Analysis/ Review Data types and Structures </h3>


For January, we go over Big O complexity and review our basic data types and structures in our language of choice. Be familiar with the basics of your language!
Big O notation is one of the most fundamental tools for computer scientists to analyze the cost of an algorithm. It describes the complexity of your code using algebraic terms in terms of time and space. Basically in simple terms, it describes the complexity of an algorithm as input increases.
We use big-O notation for asymptotic upper bounds, since it bounds the growth of the running time from above for large enough input sizes.
What you need to know:
1) What is Big O?
2) Complexity of common algorithms
3) How to calculate it
4) Trade off between time vs space complexity

----

Coming from a non-CS background, this video was among the first to help me understand Big o : https://www.youtube.com/watch?v=D6xkbGLQesk&t=55s

- Another good course is from FreeCodeCamp: https://www.youtube.com/watch?v=Mo4vesaut8g

- https://www.khanacademy.org/computing/ap-computer-science-principles/algorithms-101#evaluating-algorithms

- https://www.khanacademy.org/computing/computer-science/algorithms#asymptotic-notation

- https://www.youtube.com/watch?v=_t2GVaQasRY

- https://www.youtube.com/watch?v=IR_S8BC8KI0&list=RDCMUCh9nVJoWXmFb7sLApWGcLPQ&start_radio=1&rv=IR_S8BC8KI0&t=22

- Crack the Coding Interview, both book Chapter 1(Big o) and this video: https://www.youtube.com/watch?v=v4cd1O4zkGw

- https://www.youtube.com/watch?v=zUUkiEllHG0

- https://www.tutorialspoint.com/data_structures_algorithms/asymptotic_analysis.htm

- https://sdkdeepa.medium.com/big-o-notation-what-is-this-thing-e863b6a8f87

- Great list about resources for Big O https://github.com/WomenWhoCode/wwcsf-algos/blob/master/topics/big-O.md   

---
Problems Week 1: What is the worst-case complexity of the each of the following code fragments?


1. Two loops in a row:
for (i = 0; i < N; i++) {
    sequence of statements
}
for (j = 0; j < M; j++) {
    sequence of statements
}

2. How would the complexity change if the second loop went to N instead of M?
A nested loop followed by a non-nested loop:

for (i = 0; i < N; i++) {
    for (j = 0; j < N; j++) {
        sequence of statements
    }
}

for (k = 0; k < N; k++) {
    sequence of statements
}


3. A nested loop in which the number of times the inner loop executes depends on the value of the outer loop index:
for (i = 0; i < N; i++) {
    for (j = N; j > i; j--) {
        sequence of statements
    }
}    

----
### Problems Week 2

1. Put these functions in order of increasing growth rates:
(1.5)^n,n^100,(logn)^3,√nlogn,10^n,(n!)^2,n^99+n^98,101^16
2. What is the time complexity of searching an element given its index in an array?
3) What is the time complexity of merge sort?    

#### Asymptotic bounds
https://www.youtube.com/watch?v=0oDAlMwTrLo
https://www.youtube.com/watch?v=A03oI0znAoc
https://www.youtube.com/watch?v=Nd0XDY-jVHs


#### Time complexity

https://www.youtube.com/watch?v=9TlHvipP5yA&list=PLDN4rrl48XKpZkf03iYFl-O29szjTrs_O&index=6
    
#### FREE Udacity Algo Data structure course in Swift. 

Their first lesson (Introduction and Efficiency) is about Big O and analysis. 
Link: https://classroom.udacity.com/courses/ud1011/lessons/fad64e7f-79e6-412f-bdfb-ad0a41007eab/concepts/6bb8c80e-5bf7-40be-9297-2fa25a554484 
and full course: https://classroom.udacity.com/courses/ud1011
    
----

### Week 3

leetcode problem in Swift: https://m.youtube.com/channel/UClXXFal-vwNecz_iO3o3i7A 
https://dev.to/christinamcmahon/runtime-analysis-big-o-notation-906
https://github.com/WomenWhoCode/wwcsf-algos/blob/master/topics/big-O.md


----
### Week 4

What is the time, space complexity of the following code: 
1.
int a = 0, b = 0;
for (i = 0; i < N; i++) {
    a = a + rand();
}
for (j = 0; j < M; j++) {
    b = b + rand();
}
2.
int a = 0;
for (i = 0; i < N; i++) {
    for (j = N; j > i; j--) {
        a = a + i + j;
    }
}
3.
int i, j, k = 0;
for (i = n / 2; i <= n; i++) {
    for (j = 2; j <= n; j = j * 2) {
        k = k + n / 2;
    }
}

- O(N + M) time, O(1) space,O(N*N), O(nLogn)

https://sdkdeepa.medium.com/4-connecting-the-dots-big-o-and-stacks-data-structure-4d31310e894b
