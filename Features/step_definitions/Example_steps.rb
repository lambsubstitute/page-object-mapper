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

  page_object = lookup_text_fields(page_object, lookup_name)
  page_object = lookup_buttons(page_object, lookup_name)
  page_object = lookup_links(page_object, lookup_name)
  page_object = lookup_selects(page_object, lookup_name)

  @identifier_list.each do |element|
    element = element + '
    **PUT LOOKUP HERE**'
    page_object = page_object.gsub('**PUT LOOKUP HERE**', element)
  end

  page_object = page_object.gsub('**PUT LOOKUP HERE**', '')
  puts "page object after all amendments and from step defs"
  puts page_object

  # dont forget you now need to save the page object
end


And /^I test the page objects by searching$/ do

end






