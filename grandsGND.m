% grandsGND()   - Re-compute the ERP grand averages in a Mass Univariate 
%                 ERP Toolbox GND struct variable.
%
% Usage:
%  >> GND=grandsGND(GND);
%
% Required Inputs:
%   GND - A Mass Univariate ERP Toolbox GND structure variable.  To create a 
%         GND variable from Kutaslab ERP files (e.g., *.mas files) use 
%         avgs2GND.m.  To do the same from EEGLAB *.set files use sets2GND.m.
%         See Mass Univariate ERP Toolbox documentation for detailed 
%         information about the format of a GND variable. 
%
% Outputs:
%   GND           - Mass Univariate ERP Toolbox GND structure variable.  
%                   This is the same as the input GND variable, but grand
%                   averages have been re-computed.
%
% Notes:
% -GND variable is NOT saved to disk after baselining
%
% Author:
% David Groppe
% Kutaslab, 3/2010

function GND=grandsGND(GND)

%Recompute grands, stders, & grand t-scores
GND.grands=[];
GND.grands_t=[];
GND.grands_stder=[];
GND.grands_r=[];
[n_chan, ~, n_bin, ~]=size(GND.indiv_erps);
for b=1:n_bin,
    bin_subs=find(GND.indiv_bin_ct(:,b));
    GND.sub_ct(b)=length(bin_subs);
    if GND.sub_ct(b),
        GND.grands(:,:,b)=mean(GND.indiv_erps(:,:,b,bin_subs),4);
        GND.grands_stder(:,:,b)=std(GND.indiv_erps(:,:,b,bin_subs),0,4)/sqrt(GND.sub_ct(b));
        if ~isfield(GND,'corelate') || isempty(GND.corelate),
            GND.grands_t(:,:,b)=GND.grands(:,:,b)./GND.grands_stder(:,:,b);
        else
            for chan_i=1:n_chan,
                GND.grands_r(chan_i,:,b)=corr(GND.corelate(bin_subs),squeeze(GND.indiv_erps(chan_i,:,b,bin_subs))');
            end;
            GND.grands_t(:,:,b)= sqrt(GND.sub_ct(b) - 2) * GND.grands_r(:,:,b) ./ sqrt(1 - GND.grands_r(:,:,b) .^2);
        end
    else
        watchit(sprintf('No average files contribute to bin %d.',b));
    end
end
%Recompute grand cal pulses
if ~isempty(GND.cals),
    GND.cals.grand_cals=mean(GND.cals.indiv_cals,3);
end

GND.saved='no';


