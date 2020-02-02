# Mass_Univariate_ERP_Toolbox_for_correlations
[Mass Univariate ERP Toolbox v2017-03-27](http://sccn.ucsd.edu/eeglab/plugins/mass_uni_toolbox03272017.zip) from [EEGLAB repository](https://sccn.ucsd.edu/eeglab/plugin_uploader/plugin_list_all.php) with patches for Pearson correlation. It also contains some additional fixes and enhancements over [original code](http://sccn.ucsd.edu/eeglab/plugins/mass_uni_toolbox03272017.zip). Please note, that this base version a bit differ from [upstream toolbox version](https://github.com/dmgroppe/Mass_Univariate_ERP_Toolbox).

### MATLAB functions for analyzing and visualizing large numbers of *t*-tests performed on event-related potential data.

The Mass Univariate ERP Toolbox is a freely available set of MATLAB functions for performing mass univariate analyses of event-related potentials (ERPs), a noninvasive measure of neural activity popular in cognitive neuroscience. A mass univariate analysis is the analysis of a massive number of simultaneously measured dependent variables via the performance of univariate hypothesis tests (e.g., *t*-tests).  Savvy corrections for multiple comparisons are applied to make spurious findings unlikely while still retaining a useful degree of statistical power. The advantages of mass univariate analyses include:
  * Reduced need for a priori defined time windows/regions of interest
  * Discovery of unexpected effects even when a priori time windows/regions of interest are available
  * Greater spatial and temporal resolution than conventional mean time window analyses

The disadvantages of mass univariate analyses are that they lose some statistical power due to correction for multiple comparisons and some popular corrections for multiple comparisons are not guaranteed to work or may not provide the degree of certainty provided by selective analyses of a priori time windows/regions of interest.  Currently the toolbox supports within-subject and between-subject *t*-tests with false discovery rate controls and control of the family-wise error rate via permutation tests.

This toolbox was produced by members of the [Kutaslab](http://kutaslab.ucsd.edu/) of the [Department of Cognitive Science](http://www.cogsci.ucsd.edu/) at the University of California, San Diego.  If you use the toolbox to perform analyses or to produce figures used in a publication, please cite the following article:

[Groppe, D.M., Urbach, T.P., Kutas, M. (2011) Mass univariate analysis of event-related brain potentials/fields I: A critical tutorial review, *Psychophysiology*, 48(12) pp. 1711-1725, DOI: 10.1111/j.1469-8986.2011.01273.x](http://www.cogsci.ucsd.edu/~dgroppe/PUBLICATIONS/mass_uni_preprint1.pdf)


---
### Permutation tests on t-values of Pearson correlation
This toolbox modification is designed to run permutation tests on _t-values of Pearson correlation_ between ERP data and custom data. Two variants of permutation tests for correlations were implemented so far:

 - Cluster-based permutation test on t-values of Pearson correlation (in `clustGND` and its `clust_perm1`)
 - t<sub>max</sub> permutation test on t-values of Pearson correlation (in `tmaxGND` and its `mxt_perm1`)

#### QUICK START for permutation tests on t-values of Pearson correlation:

1. In MATLAB open EEGLAB and load all relevant datasets to initialize `ALLEEG` variable.

2. Initialize GND variable (`auto_bins` option will automatically create bins, or you can use `bin_info2EEG` for proper solution):

   `GND=sets2GND(ALLEEG,'bsln',NaN,'auto_bins',1);`
   
3. Define `GND.corelate` values for correlations with ERP data. `GND.corelate` must be `N`x`1` size vector, where `N` is number of EEG datasets (participants). E.g. for ten EEG datasets:

   `GND.corelate=[9.2 2.8 4.3 8.1 5.9 6.1 7.2 5.5 4.9 3.9 ]';`
   
4. If `GND.corelate` defined and is not empty, then you can run some permutation test on _t-values of Pearson correlation_ (If `GND.corelate` is empty or does not exist, then permutation test will be run on _Student t-values_!)

   `GNDc=clustGND(GND,1); % cluster-based permutation test `
   
   `GNDt=tmaxGND(GND,1);  % t-max permutation test`

5. If later you want to run original permutation test on _Student t-values_, please rename/remove `GND.corelate` field.

#### Credits
Patches to run permutation tests on t-values of Pearson correlation made by M. Baranauskas for scientific research. This modified toolbox version was used in these published works: 

- [Baranauskas M, Grabauskaitė A, Griškova-Bulanova I. Brain responses and self-reported indices of interoception: Heartbeat evoked potentials are inversely associated with worrying about body sensations. Physiol. Behav. 2017;180:1–7. DOI: 10.1016/j.physbeh.2017.07.032
](https://doi.org/10.1016/j.physbeh.2017.07.032).

- [Baranauskas M. Associations of brain electrical activity with heart rate regulation and body awareness](https://www.lvb.lt/permalink/f/1ss1v9f/ELABAETD32333954)


---
### Original documentation and a tutorial for using the code are available here:
[http://openwetware.org/wiki/Mass_Univariate_ERP_Toolbox](http://openwetware.org/wiki/Mass_Univariate_ERP_Toolbox)


---
DISCLAIMER: The Mass Univariate ERP toolbox is written and released for research purposes only with no guarantee of suitability for any particular purpose. This software, or data obtained from this software, should not under any circumstances be used for clinical purposes.
