Given /^I am on the base page to be mapped$/ do
  @browser.goto(BASE_URL)
  donation = Donation.new(@browser)
  donation.enter_text_into_MessageAndAmount_Amount('277')
  donation.enter_text_into_MessageAndAmount_Message('hello this is an awesome test')
  donation.enter_text_into_MessageAndAmount_Name('mr boogle')
  donation.click_MessageAndAmount_CurrencyCode_select('USD')
  donation.set_radio_radio_amount_2
  donation.set_checkbox_hide_amount
  donation.click_Continue_link

  identity = Identity_jg.new(@browser)
  identity.enter_text_into_Identity_EmailAddress('tester21321321@dsfdsfdsf.com')
  identity.click_Continue_link

  authentication = Authentication_jg.new(@browser)
  authentication.enter_text_into_Authentication_Password('Password123')
  authentication.click_Continue_link

  payment = Payment_jg.new(@browser)
  payment.enter_text_into_Payment_CardNumber('4111 1111 1111 1111 ')
  payment.enter_text_into_Payment_NameOnCard('tester')
  payment.click_Payment_CardType_select('Visa Debit')
  payment.click_Payment_ExpiryDatePart_Month_select('12')
  payment.click_Payment_ExpiryDatePart_Year_select('2020')
  payment.click_Continue_link

  payment_address = Payment_BillingAddress_jg.new(@browser)
  payment_address.click_Payment_BillingAddress_Country_select('United Kingdom')
  sleep 2
  #payment_address.enter_text_into_Payment_BillingAddress_AddressLine1('address line 1')
  #payment_address.enter_text_into_Payment_BillingAddress_AddressLine2('2 address line 2')
  #payment_address.enter_text_into_Payment_BillingAddress_HouseNumber('116')
  #payment_address.enter_text_into_Payment_BillingAddress_Postcode('12345')
  #payment_address.enter_text_into_Payment_BillingAddress_Town('town')
  #payment_address.click_Continue_link
end

And /^I map the div with the look up type of (.*) and name of (.*) with the class name (.*)$/ do |lookup_type, lookup_name, po_class_name|
  lookup_type = lookup_type.downcase
  @identifier_list = Array.new

  page_object = set_up_page_object(po_class_name, lookup_name, lookup_type)

  page_object = lookup_text_fields(page_object, lookup_name)
  page_object = lookup_buttons(page_object, lookup_name)
  page_object = lookup_links(page_object, lookup_name)
  page_object = lookup_selects(page_object, lookup_name)
  page_object = lookup_radios(page_object, lookup_name)
  page_object = lookup_checkboxes(page_object, lookup_name)

  page_object = inject_identifier_lookups(page_object)


  save_page_object(page_object)
  # dont forget you now need to save the page object
  # TODO save page object as file
end


And /^I test the page objects$/ do

end






