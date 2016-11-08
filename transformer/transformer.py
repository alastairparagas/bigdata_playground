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
      entity_value = str(attributes.text).strip().replace(",", "")
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
  with open(output_file_name, 'w') as output_file:
    json.dump(entity_list, output_file)

'''
Generates a Hive-friendly CSV file based on 
  provided list of entities
@param {string} output_file_name
@param {[]} entity_list
'''
def generate_hive_csv(output_file_name, entity_list):
  with open(output_file_name, 'w') as output_file:
    csv_writer = csv.DictWriter(
      output_file, 
      entity_list[0].keys()
    )
    csv_writer.writeheader()
    csv_writer.writerows(entity_list)
    
  
  
def main():
  data_folder = path.normpath(path.join(
    path.abspath(__file__),
    "../../data"
  ))

  input_xml_files_list = glob.glob(
    data_folder + "/xml/company/*.xml"
  ) + glob.glob(
    data_folder + "/xml/premiere/*.xml"
  )

  for input_xml_file in input_xml_files_list:
    root = ElementTree.parse(input_xml_file).getroot()
    
    output_csv_file = path.join(
      data_folder, 
      "csv", 
      path.split(path.dirname(input_xml_file))[1], 
      path.basename(input_xml_file).replace(".xml", ".csv")
    )
    output_json_file = path.join(
      data_folder, 
      "json", 
      path.split(path.dirname(input_xml_file))[1], 
      path.basename(input_xml_file).replace(".xml", ".json")
    )
    
    for directory in [path.dirname(output_csv_file), 
                      path.dirname(output_json_file)]:
      if not path.exists(directory):
        makedirs(directory)

    generate_hive_csv(output_csv_file, xmlroot_to_list(root))
    generate_mongo_json(output_json_file, xmlroot_to_list(root))

if __name__ == "__main__":
  main()
    