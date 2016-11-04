# Simple script that converts provided XML input files to
# * JSON file suitable for import on MongoDB
# * CSV file suitable for storing on HDFS and querying with Hive

import glob
import json
from os import path, makedirs
from xml.etree import ElementTree
import csv


'''
Parses an XML document into a list of dicts
@param {xml.etree.ElementTree} element_tree_root
@returns {[{}]}
'''
def xmlroot_to_list(element_tree_root):
  entities = []
  
  for entity in element_tree_root:
    entity_attributes = {}
    for attributes in entity:
      entity_key = str(attributes.tag).strip()
      entity_value = str(attributes.text).strip()
      entity_attributes[entity_key] = entity_value
    entities.append(entity_attributes)
    
  return entities

'''
Generates a Mongo-friendly JSON file based on 
  provided list of entities
@param {string} output_file_name
@param {[]} entity_list
'''
def generate_mongo_json(output_file_name, entity_list):
  output_file_name = output_file_name + ".json"
  
  with open(output_file_name, 'w') as output_file:
    json.dump(entity_list, output_file)

'''
Generates a Hive-friendly CSV file based on 
  provided list of entities
@param {string} output_file_name
@param {[]} entity_list
'''
def generate_hive_csv(output_file_name, entity_list):
  output_file_name = output_file_name + ".csv"
  
  with open(output_file_name, 'w') as output_file:
    csv_writer = csv.DictWriter(
      output_file, 
      entity_list[0].keys()
    )
    csv_writer.writeheader()
    csv_writer.writerows(entity_list)

xml_files_path = path.normpath(path.join(
  path.abspath(__file__), 
  "../../data/xml"
))
json_files_path = path.normpath(path.join(
  path.abspath(__file__),
  "../../data/output"
))

input_xml_files_list = glob.glob(
  xml_files_path + "/company/*.xml"
) + glob.glob(
  xml_files_path + "/premiere/*.xml"
)

for input_xml_file in input_xml_files_list:
  root = ElementTree.parse(input_xml_file).getroot()
  output_file_name = path.join(
    json_files_path, 
    path.basename(path.dirname(input_xml_file)),
    path.basename(input_xml_file).replace(".xml", "")
  )
  
  storage_directory = path.dirname(output_file_name)
  if not path.exists(storage_directory):
    makedirs(storage_directory)
    
  generate_hive_csv(output_file_name, xmlroot_to_list(root))
  generate_mongo_json(output_file_name, xmlroot_to_list(root))
  