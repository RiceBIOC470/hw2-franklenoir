function mm=meannonan(x)
%row col
% alternatively... mm = nanmean(x);
notin=isnan(x) | isinf(x);
invalid = sum(notin');
x(notin) = 0;
sz = size(x);
temp = [];
for i = 1:sz(1)
    temparr = x(1:sz(2),i);
    temp(i) = sum(temparr)/(sz(2)-invalid(i));
end
mm = temp;
end

