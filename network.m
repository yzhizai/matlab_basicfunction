threshold_absolute.m
threshold_proportional.m
%these two function are used to threshold the connectivity matrices,
%especially for capturing backbone network 


%This part is used to caculate the characteristic path length
%for we always used the weighted matrix,so:
weight_conversion.m %here the connection-lengths matrix is defined 
                    %as the inverse of the connection-weights matrix.
                    
%the next step is to obtain the distance matrix.
distance_wei.m

%then use the next function to get the charactoristic path length.
charpath.m

%This part is used to caculate the Clustering coefficient
clustering_coef_wu.m

%This part is used to caculate the Global Efficiency and Local
%Efficiency
efficiency_wei.m

%This part is used to caculate the Modularity
%We found the published paper normaly used Newman' method,so:
modularity_und.m
