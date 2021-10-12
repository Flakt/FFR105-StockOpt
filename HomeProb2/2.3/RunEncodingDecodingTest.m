% Test of encoding and decoding
%
% Encoding: Starting from two weight matrices (wIH and wHO), of size nHidden x (nIn+1) and
%           nOut x (nHidden+1), respectively, generate a single chromosome, such that the
%           first nHidden x (nIn+1) genes are used for obtaining wIH and the remaining
%           genes for wHO. The genes should take values in the range [0,1] 
%           (e.g. 0.219412987333, 0.452951914512, and so on), meaning that the
%           weights must be rescaled appropriately (with the help of wMax, see below), 
%           during encoding.
%
% Decoding: Starting from a chromosome of length nHidden x (n   In+1) + nOut x (nHidden+1), use
%           The first nHidden x (nIn+1)  genes to obtain wIH, and the remaining genes
%           to obtain wHO. The weights and the biases (i.e. the elements of the matrices) 
%           should take values in the range [-wMax,wMax], so the alleles (values of the
%           genes in the chromosome) must be rescaled correctly.
%

% The maximum (absolute) value of weights and biases. Thus, they take values in
% the range [-wMax,wMax]
wMax = 5;

% Sample network of size 3-3-2. Note the the number of rows in wIH MUST be
% equal to the number of columns in wHO, minus 1; see also the definition of nH below.
%
% Note: Your encoding and decoding methods should work for any values of nIn, nHidden, and nOut,
% not just for the example below! Thus, test your encoding and decoding functions by
% defining different set of matrices wIH and wHO (fulfilling the criterion on nH, see below)
%
wIH = [2 1 -3 1; 5 -2 1 4; 3 0 1 2; 2 0 3 4; 1 -1 -4 0; -5 0 1 2; 3 1 2 5;];
wHO = [1 0 -4 3 5 1 2 3; 4 3 -2 -3 1 -2 0 1];
nIn = size(wIH,2)-1;
nHidden = size(wIH,1); % must be equal to size(wHO,2)-1, for a valid set of matrices for an FFNN
nOut = size(wHO,1);

chromosome = EncodeNetwork(wIH, wHO, wMax);
[wNewIH,wNewHO] = DecodeChromosome(chromosome,nIn,nHidden,nOut,wMax);
tolerance = 1E-8;
numberOfErrors =  0;

for i = 1:nHidden
 for j = 1:nIn+1
   difference = abs(wIH(i,j)-wNewIH(i,j));
   if (difference > tolerance)
    sprintf('Error for element %d,%d in wIH', i, j)
    numberOfErrors = numberOfErrors+1;
   end 
 end
end

for i = 1:nOut
 for j = 1:nHidden+1
   difference = abs(wHO(i,j)-wNewHO(i,j));
   if (difference > tolerance)
    sprintf('Error for element %d,%d in wHO', i, j)
    numberOfErrors = numberOfErrors+1;
   end 
 end
end

if (numberOfErrors == 0)
 sprintf('Test completed: No errors')
end
