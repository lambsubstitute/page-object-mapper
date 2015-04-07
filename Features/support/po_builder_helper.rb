def build_page_object_on_class(class_name, lookup_name)
  # build the initial page object based on an class based look up
  page_object = get_file(BASE_PAGE_OBJECT_FILE_LOCATION)
  page_object = replace_lookup(page_object, lookup_name)
  page_object = replace_classname(page_object, class_name)
  page_object = replace_look_up_method_name(page_object, lookup_name)
  return page_object
end


def build_page_object_on_id(id_name, lookup_name)
  # build the initial page object based on an id based look up
  page_object = get_file(BASE_PAGE_OBJECT_FILE_LOCATION)
  page_object = replace_lookup(page_object, lookup_name)
  page_object = replace_id_specific_changes(page_object) #page_object.gsub('class', 'id').gsub('MAIN_DIV_CLASS', 'MAIN_DIV_ID').gsub('/','"' )
  page_object = replace_classname(page_object, id_name)
  page_object = replace_look_up_method_name(page_object, lookup_name)
  return page_object
end

def replace_look_up_method_name(po, lookup_name)
  # replace the main div look up method with the name of the lookup element
  # also store the main look up method name for use later
  @main_lookup_method_name = 'get_' + lookup_name + '_div'
  puts 'main lookup method name: ' + @main_lookup_method_name
  return po.gsub('def get_lookup_div', 'def get_' + lookup_name + '_div')
end


def replace_id_specific_changes(po)
  # extra changes required for the class to id changees to match id type look up
  return po.gsub('class', 'id').gsub('MAIN_DIV_CLASS', 'MAIN_DIV_ID').gsub('/', '"')
end


def replace_lookup(po, lookup_name)
  # replace the main div look up place holder based with the look up name required
  return po.gsub('**REPLACE_CLASS_LOOKUP**', lookup_name)
end


def replace_classname(po, class_name)
  # replace the class name holder with the required class name
  return po.gsub('**REPLACE_CLASS_NAME**', 'class ' + fix_classname(class_name)).gsub('# id documentation', '# class documentation')
end


def fix_classname(c)
  # Fix the class name based on the rules of class names in ruby
  # capatilize the first character in case it has not been
  # and replace spaces with underscores to keep format
  c[0] = c[0].capitalize
  c = c.gsub(' ', '_')
  return c
end


def get_file(file_location)
  # open the base bage object file and pass the contents back as a string
  file = File.open(file_location, "r")
  data = file.read
  file.close
  return data
end

def fix_method_names_and_lookups(temp, id, name_type)
  fixed_id = id.gsub('-', '_')
  lookup_name = fixed_id.upcase + name_type
  @identifier_list.push(lookup_name + ' = ' + id)
  return temp.gsub('fixed_id', fixed_id).gsub('@main_lookup_method_name', @main_lookup_method_name).gsub('lookup_name', lookup_name)
end

def lookup_text_fields(po)
  # find all the text fields in the page and create methods to interact with each one
  # this will only find text fields that are visible, present, and enabled
  # once found it will store the id`s for the identified elements`
  puts 'looking up textfields'
  text_field_ids = Array.new()
  text_fields = @browser.text_fields # returns a watir collection object of text field elements, this still finds textareas which dont work correctly yet

  text_fields.each do |element|
    if element.visible? && element.present? && element.enabled?
      text_field_ids.push(element.attribute_value('id'))
    end
  end

  text_field_ids.each do |id|
    temp_text_methods = get_file(BASE_TEXT_FIELD_METHODS_FILE_LOCATION)
    temp_text_methods = fix_method_names_and_lookups(temp_text_methods, id, "_TEXTFIELD_ID")
    po = po.gsub('**ADD TEXT FIELD METHODS HERE**', temp_text_methods)
  end

  po = po.gsub('**ADD TEXT FIELD METHODS HERE**', '')
  return po
end




def lookup_buttons(po)
  # find all the buttons in the page and create methods to interact with each one
  # this will only find text fields that are visible, present, and enabled
  # once found it will store the id`s for the identified elements`
  puts 'looking up buttons'
  button_ids = Array.new()
  buttons = @browser.buttons # returns a watir collection object of text field elements, this still finds textareas which dont work correctly yet

  buttons.each do |element|
    if element.visible? && element.present? && element.enabled?
      button_ids.push(element.attribute_value('name'))
    end
  end

  button_ids.each do |id|
    temp_button_methods = get_file(BASE_BUTTON_METHODS_FILE_LOCATION)
    temp_button_methods = fix_method_names_and_lookups(temp_button_methods, id, "_BUTTON_NAME")
    #puts temp_button_methods
    po = po.gsub('**ADD BUTTON METHODS HERE**', temp_button_methods)
  end

  po = po.gsub('**ADD BUTTON METHODS HERE**', '')
  return po
end

