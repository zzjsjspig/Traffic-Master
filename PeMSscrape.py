
from selenium import webdriver
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import Select
from selenium.common.exceptions import NoSuchElementException
import unittest, time, re
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.common.action_chains import ActionChains
import csv
import os
import random
from random import randint
import numpy 
from selenium.webdriver.common.keys import Keys
from selenium import webdriver
from selenium.webdriver.common.by import By



chromedriver = "/Users/NilMas/Downloads/chromedriver"
os.environ["webdriver.chrome.driver"] = chromedriver
driver = webdriver.Chrome(chromedriver)

driver.get("http://pems.dot.ca.gov")
driver.find_element_by_id("username").send_keys("lin.cs.samuel@berkeley.edu")
driver.find_element_by_id("password").send_keys("11green!*Wca")

driver.find_element_by_name("login").click()

driver.implicitly_wait(15)
driver.find_element_by_partial_link_text("Clearinghouse").click()


driver.implicitly_wait(15)
driver.find_element_by_id("type").send_keys("Station 5-Minute")
driver.find_element_by_id("district_id").send_keys("District 7")
driver.find_element_by_id("submit").click()
driver.implicitly_wait(15)

driver.find_element_by_xpath("//a[contains(@href, '2017')]").click()

time.sleep(15)
file_list = driver.find_elements_by_partial_link_text("d07_text_station_5min")

num=0
for eachFile in file_list:

    if num>96:
        time.sleep(35)
        driver.implicitly_wait(20)
        eachFile.click()
        print(eachFile)
    num=num+1
    










