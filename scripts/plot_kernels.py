#!/bin/env python

import re
import sys
import json

try:
    import matplotlib
    import matplotlib.pyplot as plt
    from matplotlib.backends.backend_pdf import PdfPages

    color_names = []
    for name, hex in matplotlib.colors.cnames.iteritems():
        color_names.append(name)

    pdf = PdfPages('kgen_kernels.pdf')
except:
    print 'ERROR: matplotlib module is not loaded.'
    sys.exit(-1)

REF_NAME = 'SNB'
CPU_MODEL_NAME = re.compile(u'^model\sname[\t\s]+:\s(?P<modelname>.+$)', re.M)

def getinfo(string, pattern, method='search', **flags):
    out = None
    try:
        exec('out = pattern.%s(string, **flags)'%method)
    except:
        pass
    return out

def main():

    in_tests = []

    for in_test in sys.argv[1:]:
        try:
            with open(in_test, 'r') as f:
                in_tests.append(json.load(f))        
        except Exception as e:
            print str(e)
            sys.exit(-1)

    platform_labels = []
    tests = {}

    # collect data from raw data
    for in_test in in_tests:
        try:
            # collect common in_test attributes
            cpuname = getinfo(in_test[u'cpuinfo'], CPU_MODEL_NAME).group('modelname')
            in_testbegin = in_test[u'begin']
            in_testend = in_test[u'end']
            env = in_test[u'env']
            top = in_test[u'top']
            gitcommit = in_test[u'gitcommit']
            meminfo = in_test[u'meminfo']
            gitbranch = in_test[u'gitbranch']
            gitdiff = in_test[u'gitdiff']
            ifort = in_test[u'ifort'].split('\n')[0]

            platform_label = gitbranch[:3].upper()
            platform_labels.append(platform_label)

            test = {}
            tests[platform_label] = test
            
            test['cpuname'] = cpuname
            test['testdatetime'] = in_testend
            test['ifort'] = ifort

            cases = {}
            test['cases'] = cases

            for in_testpath, in_testcase in in_test[u'tests'].items():
                # collect in_test case attributes

                etime = in_testcase[u'etime']
                if len(etime)==0: continue
                #if sum(etime)/len(etime)<10.0: continue

                passed = in_testcase[u'passed']
                diff = in_testcase[u'diff']
                casebegin = in_testcase[u'begin']
                caseend = in_testcase[u'end']
                tol = in_testcase[u'tol']

                perf = {}
                for line in in_testcase[u'perf-stat'].split('\n'):
                    if len(line)<49: continue
                    valuestr = line[:20].strip()
                    event = line[20:48].strip()
                    ratiostr = line[48:].strip()
                    rval, runit = None, None
                    if ratiostr:
                        try:
                            possharp = ratiostr.find('#')
                            if possharp>=0:
                                rstr = ratiostr[possharp+1:].strip()
                                rv, ru = rstr.split(None, 1)
                                rval = float(rv)
                                runit = ru.strip()
                        except: pass

                    try:
                        if event in [ 'task-clock (msec)', 'context-switches', 'cpu-migrations', 'page-faults', \
                            'cycles', 'stalled-cycles-frontend', 'stalled-cycles-backend', \
                            'instructions', 'branches', 'branch-misses' ]:
                            value = float(valuestr.replace(',',''))
                            perf[event] = [ value, rval, runit ]
                    except: pass

                case = {}
                cases[in_testpath] = case

                case['etime'] = etime
                case['diff'] = diff
                case['tol'] = tol
                case['perf'] = perf
        except Exception as e:
            print str(e)
            sys.exit(-1)
                
    # pack data for plotting and reporting

    # collect reference data from reference platform
    ref_data = tests[REF_NAME]
    ref_cases = ref_data['cases']

    ref_etime = {}
    for casename, case in ref_cases.items():
        avg_etime = sum(case['etime']) / len(case['etime'])
        ref_etime[casename] = avg_etime

    plot_etime = {}

    for platform, test in tests.items():

        cputime = test['cpuname']
        testdatetime = test['testdatetime']
        ifort = test['ifort']

        for casename, case in test['cases'].items():
            if casename in ref_etime:
                if not plot_etime.has_key(casename):
                    plot_etime[casename] = [ 0.0 ] * len(platform_labels)
                avg_etime = sum(case['etime']) / len(case['etime'])
                #plot_etime[casename][platform_labels.index(platform)] = avg_etime / ref_etime[casename]
                plot_etime[casename][platform_labels.index(platform)] =  ref_etime[casename] / avg_etime


    #import pdb; pdb.set_trace()

    width = 0.7
    interval = 1.0
    for casename, etime in plot_etime.items():
        fig = plt.figure(figsize=(10, 6))
        #barplots = []
        xticks = []
        for i in range(len(platform_labels)):
            barplot = plt.bar(i + interval/2 - width/2, etime[i], width, color=color_names[i])
            xticks.append(i + interval/2)
            #barplots.append(barplot)
        #plt.legend(barplots, platform_labels)
        plt.title(casename)
        plt.xlabel('platform')
        plt.ylabel('Relative Performance to SNB')
        plt.xticks(xticks, platform_labels)
        pdf.savefig(fig)
        #plt.show()


    pdf.close()

        # create plots
                        # relative elapsed time plots per each test case


                        # clustering plots to relative elapsed time( KNL / HSW )
                        # many categories

        # summary plots
        # - combined relative epalsed time plot
        # - Normalized RMS difference plot
        # - combined clusterings plot
        # - 
        # - 

if __name__ == '__main__':
    main()
