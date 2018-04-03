#! /usr/bin/python

#  Copyright 2018 Eduardo Uribe
#
# Requirements: pip install TestLink-API-Python-client
# ------------------------------------------------------------------------

import testlink
import sys
import os

# server_url = "https://testlink.wearegap.com/lib/api/xmlrpc/v1/xmlrpc.php"
# dev_key = "ID_KEY_FROM_TESTLINK"


def update_test_case(test_case_id, test_plan_id, build_name, status, notes):
    tls = testlink.TestLinkHelper(os.environ['TESTLINK_API_PYTHON_SERVER_URL'], os.environ['TESTLINK_API_PYTHON_DEVKEY']).connect(testlink.TestlinkAPIClient)
    response = tls.reportTCResult(int(test_case_id), int(test_plan_id), build_name, status, notes)
    print response


def main(test_case_id, test_plan_id, build_name, status, notes):
    update_test_case(test_case_id, test_plan_id, build_name, status, notes)


if __name__ == '__main__':
    try:
        argList = ['test_case_id', 'test_plan_id', 'build_name', 'status', 'notes']
        args = sys.argv[1:]
        if len(args) == 5:
            rArgs = dict(zip(argList, args))
            main(**rArgs)
    except Exception as v:
        exc_traceback = sys.exc_info()[2]
        del exc_traceback
    finally:
        print "Hello"
