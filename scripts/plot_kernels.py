#!/bin/env python

import sys
import json

try:
    import matplotlib as mp
    from matplotlib.backends.backend_pdf import PdfPages
    pp = PdfPages('multipage.pdf')
except:
    print 'ERROR: matplotlib module is not loaded.'
    sys.exit(-1)

def main():

    tests = []

    for test in sys.argv[1:]
        try:
            with open(test, 'r') as f:
                tests.append(json.load(f.read()))        
        except Exception as e:
            print str(e)
            sys.exit(-1)


    # relative elapsed time plots per each test case


    # clustering plots to relative elapsed time( KNL / HSW )
    # many categories


    # summary plots
    # - combined relative epalsed time plot
    # - Normalized RMS difference plot
    # - combined clusterings plot
    # - 
    # - 

    plt.savefig(pp, format='pdf')
    pp.close()

if __name__ == '__main__':
    main()
