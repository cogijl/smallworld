function [C, ASP] = ER_Parameters(n,p,iterations)
%% Generate ER graph
% n = number of nodes
% p = probability of connections
% iterations = number of times to create average

itcount = 1;

while itcount <= iterations
if n < 25
    errorn='number of nodes must be greater than 25';
    disp(errorn);
    break
elseif p > 1
    errorp1='p must be a value between 0 and 1';
    disp(errorp1);
    break
elseif p <= 0
    disp(errorp1);
    break
end;

% display a wait bar so you know roughly what is happening. Large networks
% take a long time...
% h = waitbar(0,'Initializing waitbar...');
% perc = (itcount/iterations) * 100;
% h = waitbar(perc/100,h,sprintf('%.0f%% along...',perc));

% code is the same as that from erdos_renyi.m
% David Gleich
% Copyright, Stanford University, 2006-2008

A = triu(rand(n)<p,1);
A = sparse(A);
A = A+A';

% This code is Justin's....
% calculate expected average number of edges
% l = (n/2)*p;

%% caluclate clustering coefficient 

CE = clustering_coefficients(A);
ClusterCoeff_temp = mean(CE);

%%  calculate ASP
D = all_shortest_paths(A);
ASP_temp= mean2(D);

cluster_vec(itcount)=ClusterCoeff_temp;
ASP_vec(itcount)=ASP_temp;
% remove infinite values
ASP_vec=ASP_vec(~isinf(ASP_vec));
ASP_vec=ASP_vec(~isinf(ASP_vec));
ASP_vec=ASP_vec(ASP_vec~=0);
assignin('base','cluster_vec',cluster_vec);
assignin('base','ASP_vec',ASP_vec);

% increment
itcount = itcount + 1;
% close(h);
end;
% disp(itcount)
C=mean(cluster_vec);
ASP=mean(ASP_vec);

