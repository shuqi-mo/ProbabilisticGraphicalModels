function factors = ComputeAllSimilarityFactors (images, K)
% This function computes all of the similarity factors for the images in
% one word.
%
% Input:
%   images: An array of structs containing the 'img' value for each
%     character in the word.
%   K: The alphabet size (accessible in imageModel.K for the provided
%     imageModel).
%
% Output:
%   factors: Every similarity factor in the word. You should use
%     ComputeSimilarityFactor to compute these.
%
% Copyright (C) Daphne Koller, Stanford University, 2012

n = length(images);
nFactors = nchoosek (n, 2);

factors = repmat(struct('var', [], 'card', [], 'val', []), nFactors, 1);

% Your code here:
V = [1:n];
C = combnk(V, 2);
for indexFactors = 1:nFactors
    i = C(indexFactors, 1);
    j = C(indexFactors, 2);
    factors(indexFactors) = ComputeSimilarityFactor(images, K, i, j);
end
end

