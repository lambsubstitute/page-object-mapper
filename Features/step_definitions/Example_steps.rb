Given /^I am on the base page to be mapped$/ do
  @browser.goto(BASE_URL)
end

And /^I map the div with the look up type of (.*) and name of (.*) with the class name (.*)$/ do |lookup_type, lookup_name, po_class_name|
  lookup_type = lookup_type.downcase
  @identifier_list = Array.new

  if lookup_type == 'id'
    @browser.div(:id, lookup_name).wait_until_present
    page_object = build_page_object_on_id(po_class_name, lookup_name)
  elsif lookup_type == 'class'
    @browser.div(:class, lookup_name).wait_until_present
    page_object = build_page_object_on_class(po_class_name, lookup_name)
  else
    puts "COULD NOT BUILD THE PAGE OBJECT AS THE TYPE LOOK UP FAILED"
  end

  page_object = lookup_text_fields(page_object)
  page_object = lookup_buttons(page_object)

  @identifier_list.each do |element|
    element = element + '
    **PUT LOOKUP HERE**'
    page_object = page_object.gsub('**PUT LOOKUP HERE**', element)
  end

  page_object = page_object.gsub('**PUT LOOKUP HERE**', '')
  puts "page object after all amendments and from step defs"
  puts page_object
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



def fix_method_names_and_lookups(temp, id, name_type)
  fixed_id = id.gsub('-', '_')
  lookup_name = fixed_id.upcase + name_type
  @identifier_list.push(lookup_name + ' = ' + id)
  return temp.gsub('fixed_id', fixed_id).gsub('@main_lookup_method_name', @main_lookup_method_name).gsub('lookup_name', lookup_name)
end



