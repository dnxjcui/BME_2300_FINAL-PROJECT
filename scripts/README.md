## General Information
All the data and file naming conventions are taken from the source: https://physionet.org/content/auditory-eeg/1.0.0/

### data_prep_src
Contains files for prepping `.csv` files into more `.mat` files, for the the purposes of this experiment and corresponding compatibility.
>**For user purposes**, you only have to edit the paths within `main.py` that are commented for one to do so.


### eval_src
Contains files that are used for evaluating the `.mat` files. Includes a sample script for how to use FFT, as well as various scripts (TO BE ADDED) for performing quantitative and qualitative analysis.
>Notes to self - can consider adding stochastic resonance for segments with low signal power. FFT can/should be smoothed via some sort of algorithm: I personally propose arbitrarily binning the data via a constant.
