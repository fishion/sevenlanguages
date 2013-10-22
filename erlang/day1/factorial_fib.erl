-module(factorial_fib).
-export([factorial/1]).
-export([fibonacci/1]).

factorial(0) -> 1;
factorial(N) -> N * factorial(N-1).

% this is a startlingly inefficient way to calculate the fibonacci sequence isn't it?
% for each step we're branching off and calculating back to the start. Don't try to calculate
% the value much beyond 40 or it will hang!
fibonacci(0) -> 1;
fibonacci(1) -> 1;
fibonacci(N) -> fibonacci(N-1) + fibonacci(N-2).
