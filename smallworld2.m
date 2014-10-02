function [result,S,Crand,Lrand] = smallworld(n,p,Cg,Lg)
%% SmallWorld
% this calculates whether or not the matrix is a small world, as per the
% Humpheries and Gurney (2008) article in PLoS One titled "Network 
% 'small-world-ness': a quantitative method for determining canonical 
% network equivalence."

% n = number of nodes in the Erdos-Renyi Network
% p = probability of connections in the Erdos-Renyi Network
% Cg = the clustering coefficient of the network
% Crand = the clustering coefficient of the idealized E-R network
% Lg = the average shortest path length (ASP) for the network
% Lrand = the ASP for the idealized E-R network

% Union UU          Union UCSMV     Union Jonestown
% ASP
% 2.318537000       2.530941000     2.285218000
% Nodes
% 1962.000000000	2113.000000000	2115.000000000
% Density
% 0.044818440       0.022526240     0.038154920
% Clustering
% 0.471652300       0.418606300     0.504726600

%% Generate random network properties
[Crand, Lrand] = ER_Parameters(n,p,100);

%% Calculate
% define Gg

% Cg = ;
% Crand = ;
G_g = Cg/Crand;

% define Lc

% Lg = ;
% Lrand = ;
Lambda_g = Lg/Lrand;

%% calculate S
S = G_g/Lambda_g;
%% Quantatitive Small World
if S >= 1
    result = 1;
    % for the craic it was: 'Network G is a small world after all';
elseif S < 1 
    result = 0;
    % for the craic it was: 'Network G is not a small world... Kevin Bacon is dead';
end;
result = logical(result);
beep on
beep
% disp(S);







