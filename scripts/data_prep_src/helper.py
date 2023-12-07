#!/usr/bin/env python
"""
    helper.py
    Contain various helper function that help prep .csv files as .mat files

    Author      :   Nick Cui
    Copyright   :   2023
    Email       :   lening.n.cui@vanderbilt.edu
"""

import os
import time
from scipy.io import savemat
import csv

"""
Note:  Frequency in files is 200Hz. 
"""


def _save_mat(_csv_file, _output_dir):
    """
    save_mat    -   Takes a string path of a .csv file, and creates a corresponding .mat file 
                    that stores the values as such:
                                Time    -   (stored for now but hypothetically unimportant)
                                P4      -   Parietal Lobe Electrode
                                Cz      -   Midline Electrode
                                F8      -   Frontal Electrode
                                T7      -   Temporal Electrode
                    Note that all of these electrodes are based on the 10-20 system, and measure 
                    likely in microvolts. 
    Args:
        @param _csv_file    :   Name of .csv file.
        @param _output_dir  :   Output directory.
    Returns:
        @ return            :   Path to newly generated .mat file.
    """
    _time = []
    _P4 = []
    _Cz = []
    _F8 = []
    _T7 = []

    with open(_csv_file) as _file:
        _reader = csv.reader(_file)
        
        # Skipping header row
        next(_reader)
        
        for _row in _reader:
            _time.append((float)(_row[0]))
            _P4.append((float)(_row[1]))
            _Cz.append((float)(_row[2]))
            _F8.append((float)(_row[3]))
            _T7.append((float)(_row[4]))

    _output_file_name = os.path.join(_output_dir, (_csv_file[:-4] + ".mat"))
    _dict_mat = {"time": _time,
                 "P4": _P4,
                 "Cz": _Cz,
                 "F8": _F8,
                 "T7": _T7}
    print(_output_file_name)
    savemat(_output_file_name, _dict_mat)
    
    return _output_file_name


def _target_list(_input_file):
    """
    target_array    -   Takes a .txt file with targeted .csv files separated by newlines and 
                        returns a list.
    
    Args:
        @param _input_file  :   Path to .txt file
    Returns:
        @return             :   Newly formed list
    """
    _f = open(_input_file, 'r')
    return _f.read().split('\n')


def run_save_mat(_base_path, _input_file, _output_dir):
    """
    run_save_mat    -   Takes a .txt file with targeted .csv files separated by newlines as well 
                        as output directory, and generates .mat files in said output directory.
    
    Args:
        @param _base_path   :   Path to data directory containing .csv files and _input_file
        @param _input_file  :   Name of .txt file containing all target .csv files
        @param _output_dir  :   Output directory
    Returns:
        @return             :   Nothing
    """

    start = time.time()

    if not os.path.exists(_output_dir):
        os.mkdir(_output_dir)

    os.chdir(_base_path)

    _target_list_all = _target_list(os.path.join(_base_path, _input_file))
    for _target in _target_list_all:
        _save_mat(_target, _output_dir)

    end = time.time()
    
    print(f'All done! Elapsed time: {end - start:,.3f}\n')