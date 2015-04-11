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
  page_object = replace_id_specific_changes(page_object)
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

def fix_method_names_and_lookups(temp, id, name_type, type)
  # fix the method name and the look up so that they do not contain illegal characters and conform to style
  # makes a set of default mnethods for the type provided and passes these back to be added tot he page object being built
  fixed_id = id.gsub('-', '_').gsub('+', '').gsub(' ', '').gsub('\n', '').gsub("\n", '').gsub('\n', '')
  lookup_name = fixed_id.upcase + name_type
  @identifier_list.push(lookup_name + ' = "' + id + '"')
  return temp.gsub('fixed_id', fixed_id).gsub('@main_lookup_method_name', @main_lookup_method_name).gsub('lookup_name', lookup_name).gsub('*LOOKUPTYPE*', type)
end

def lookup_text_fields(po, lookup_name)
  # find all the text fields in the page and create methods to interact with each one
  # this will only find text fields that are visible, present, and enabled
  # once found it will store the id`s for the identified elements`
  main_div = @browser.div(:id, lookup_name)
  text_fields = main_div.text_fields
  po = sort_elements(*text_fields, '**ADD TEXT FIELD METHODS HERE**', '_TEXTFIELDS', po, BASE_TEXT_FIELD_METHODS_FILE_LOCATION)
  return po
end


def lookup_buttons(po, lookup_name)
  # find all the buttons in the page and create methods to interact with each one
  # this will only find text fields that are visible, present, and enabled
  # once found it will store the id`s for the identified elements`
  main_div = @browser.div(:id, lookup_name)
  buttons = main_div.buttons
  po = sort_elements(*buttons, '**ADD BUTTON METHODS HERE**', '_BUTTONS', po, BASE_BUTTON_METHODS_FILE_LOCATION)
  return po
end


def lookup_links(po, lookup_name)
  # find all the buttons in the page and create methods to interact with each one
  # this will only find text fields that are visible, present, and enabled
  # once found it will store the id`s for the identified elements`
  main_div = @browser.div(:id, lookup_name)
  links = main_div.links # returns a watir collection object of text field elements, this still finds textareas which dont work correctly yet
  po = sort_elements(*links, '**ADD LINK METHODS HERE**', '_LINKS', po, BASE_LINK_METHODS_FILE_LOCATION)
  return po
end

def lookup_selects(po, lookup_name)
  # find all the buttons in the page and create methods to interact with each one
  # this will only find text fields that are visible, present, and enabled
  # once found it will store the id`s for the identified elements`
  main_div = @browser.div(:id, lookup_name)
  selects = main_div.selects # returns a watir collection object of SELECTS (dropdowns) elements, this still finds textareas which dont work correctly yet
  po = sort_elements(*selects, '**ADD SELECT METHODS HERE**', '_SELECT', po, BASE_SELECT_METHODS_FILE_LOCATION)
  return po
end


def sort_elements(*elements, method_message, element_type, po, base_file_location)
  # generic sorting method, takes collection of html, elements, element type, and the base file location which containbs the base methods to create for the element type provided
  # create array to store elements id`s used to make up the identifiers later
  # go through each element and get the attribute value specified and store them in the identifier array

  # using the attrbute value go through and create a method set for each element of the type passed
  puts 'looking up: ' + element_type
  element_ids = Array.new()
  element_ids_types = Array.new()
  elements.each do |element|
    if element.visible? && element.present? && element.exists?
      attribute_type = find_attribute_to_look_up(element)
      element_ids_types.push attribute_type
      element_ids.push(element.attribute_value(attribute_type))
    end
  end

  count = 0
  element_ids.each do |id|
    element_methods = get_file(base_file_location)
    temp_element_methods = fix_method_names_and_lookups(element_methods, id, element_type + '_' + element_ids_types[count].upcase, element_ids_types[count])

    # add place holder so next set of methods to be added know where to go
    po = po.gsub(method_message, temp_element_methods)
  end

  # remove the holding message to clean up the new page object
  po = po.gsub(method_message, '')
  return po
end


def find_attribute_to_look_up(element)
  if element.attribute_value('id') != ''
    # pass back id as the type here
    return 'id'
  elsif element.attribute_value('name') != ''
    # pass back name as the type here
    return 'name'
  elsif element.attribute_value('text') != ''
    # pass back class as the type here
    return 'text'
  elsif element.attribute_value('class') != ''
    # pass back class as the type here
    return 'class'
  end

end

