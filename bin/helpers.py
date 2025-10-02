import csv

def get_term(id):
    """Returns the term of a concept id. F.ex. returns 'term' from 'Field:term.PoS' and 'Field:term.PoS.02'."""
    return id.split(':')[1].split('.')[0]

def get_raw_PoS(id):
    """Returns the part of speech of a concept id. F.ex. returns 'PoS' from 'Field:term.PoS' and 'Field:term.PoS.02'."""
    return id.split('.')[1].lower()

def get_PoS(id):
    pos = id.split('.')[1]
    if pos == 'r':
        return 'adv'
    else:
        return pos

def get_dictionary_filename(lang_code):
    filename = "dict/" + lang_code[0].upper() + "/" + lang_code.lower() + ".tsv"
    return filename

class csv_reader:
    """Helper for opening and closing a CSV or TSV file for reading."""
    def __init__(self, file_name, delimiter):
        self.file = open(file_name, 'r')
        self.dict = csv.DictReader(self.file, delimiter=delimiter)

    def __del__(self):
        self.file.close()

class tsv_reader:
    """Helper for opening and closing a TSV file for reading."""
    def __init__(self, file_name):
        self.file = open(file_name, 'r')
        self.dict = csv.DictReader(self.file, delimiter='\t')

    def __del__(self):
        self.file.close()

class tsv_writer:
    """Helper for opening and closing a TSV file for writing."""
    def __init__(self, file_name, open_mode):
        self.file = open(file_name, open_mode)
        self.dict = csv.writer(self.file, delimiter='\t')

    def __del__(self):
        self.file.close()

def get_other_id_to_Panlexia_id_map(other_id):
    """Creates a dictionary of ULD to Panlexia ids."""
    id_map_file = 'data/id_map.tsv'
    id_map = tsv_reader(id_map_file)
    map_to_Panlexia = {}
    for row in id_map.dict:
        if row[other_id] != "":
            map_to_Panlexia[row[other_id]] = row["id"]
    return map_to_Panlexia

class simple_file_reader:
    def __init__(self, filename):
        try:
            self.file = open(filename, 'r')
        except OSError:
            print("Error in reading file", filename)

    def __del__(self):
        self.file.close()

    def readline(self):
        return self.file.readline()

class simple_file_writer:
    def __init__(self, filename):
        try:
            self.file = open(filename, 'w')
        except OSError:
            print("Error in opening file", filename)

    def __del__(self):
        self.file.close()

    def write(self, text_string):
        return self.file.write(text_string)

def replace_string_in_file(old_string, new_string, file_name):
    '''Replaces all instances of the old_string by the new_string in the given file.'''
    # Read in the file
    with open(file_name, 'r') as file:
        filedata = file.read()

        # Replace the target string
        filedata = filedata.replace(old_string, new_string)

    # Write the file out again
    with open(file_name, 'w') as file:
        file.write(filedata)
