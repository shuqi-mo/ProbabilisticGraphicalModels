function factors = ComputeTripletFactors (images, tripletList, K)
% This function computes the triplet factor values for one word.
%
% Input:
%   images: An array of structs containing the 'img' value for each
%     character in the word.
%   tripletList: An array of the character triplets we will consider (other
%     factor values should be 1). tripletList(i).chars gives character
%     assignment, and triplistList(i).factorVal gives the value for that
%     entry in the factor table.
%   K: The alphabet size (accessible in imageModel.K for the provided
%     imageModel).
%
% Hint: Every character triple in the word will use the same 'val' table.
%   Consider computing that array once and then resusing for each factor.
%
% Copyright (C) Daphne Koller, Stanford University, 2012


n = length(images);

% If the word has fewer than three characters, then return an empty list.
if (n < 3)
    factors = [];
    return
end

factors = repmat(struct('var', [], 'card', [], 'val', []), n - 2, 1);

% Your code here:
for index = 1:n-2
    factors(index).var = [index, index+1, index+2];
    factors(index).card = [K, K, K];

    factors(index).val = ones(K*K*K, 1);
    m = length(tripletList);
    for indexTripletList = 1:m
        l = tripletList(indexTripletList).chars(1);
        j = tripletList(indexTripletList).chars(2);
        i = tripletList(indexTripletList).chars(3);
        factors (index).val((i-1)*K*K + (j-1)*K + l) = tripletList(indexTripletList).factorVal;
    end
end

end
