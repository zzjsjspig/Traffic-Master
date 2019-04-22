from __future__ import division
import os
import inspect
import sys
this_folder = os.path.dirname(os.path.abspath(inspect.getfile(inspect.currentframe())))
sys.path.insert(0,os.path.join(this_folder,'py4j','python'))
from Java_Connection import Java_Connection
import numpy as np
import time
import matplotlib.pyplot as plt
import csv


def extract_output(otm):

    for outputdata  in otm.get_output_data():

    	if 'LinkVehicles' in outputdata.getClass().getName():
    		profile = outputdata.get_profile_for_linkid(511)
    		vehs = profile.get_value_for_time(120.0)

    	if 'LinkFlow' in outputdata.getClass().getName():
    		profile = outputdata.get_flow_profile_for_link_in_vph(511)
    		flow = profile.get_value_for_time(120.0)

    return vehs, flow


###########################################################################

conn = Java_Connection()

if conn.pid is not None:

    duration = 3600.0
    outdt = 10.0

    # connect to OTM
    otm = conn.gateway.entry_point.get_OTM_API()

    # load the XML
    configfile = os.path.join(this_folder, 'XML files', 'Capstone_0314.xml')
    otm.load(configfile)

    # request outputs
    otm.request_links_flow(None, otm.get_link_ids(), outdt);
    otm.request_links_veh(None, otm.get_link_ids(), outdt);
    
    # run the simulation
    otm.run(0.0,duration)

    # extract the output
    vehs, flow = extract_output(otm)

    print(vehs, flow)

   	# set the onramp flow rate
    # otm.set_ramp_metering_rate_vph(ramp_id,value)

   	# run it again
    otm.run(0.0,duration)

    # extract the output
    vehs, flow = extract_output(otm)
    print(vehs, flow)


    # kill jvm
    conn.close()

