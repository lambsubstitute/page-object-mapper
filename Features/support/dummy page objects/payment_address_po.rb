# encoding: utf-8
# class documentation

# page built from: https://www.justgiving.com/4w350m3/donation/direct/charity/2157#Payment_BillingAddress

class Payment_BillingAddress_jg
  include PageInitializer

  # Element identifiers
  MAIN_DIV_ID = "Payment_BillingAddress"

  PAYMENT_BILLINGADDRESS_HOUSENUMBER_TEXTFIELDS_ID = "Payment_BillingAddress_HouseNumber"
  PAYMENT_BILLINGADDRESS_ADDRESSLINE1_TEXTFIELDS_ID = "Payment_BillingAddress_AddressLine1"
  PAYMENT_BILLINGADDRESS_ADDRESSLINE2_TEXTFIELDS_ID = "Payment_BillingAddress_AddressLine2"
  PAYMENT_BILLINGADDRESS_TOWN_TEXTFIELDS_ID = "Payment_BillingAddress_Town"
  PAYMENT_BILLINGADDRESS_COUNTY_TEXTFIELDS_ID = "Payment_BillingAddress_County"
  PAYMENT_BILLINGADDRESS_POSTCODE_TEXTFIELDS_ID = "Payment_BillingAddress_Postcode"
  JUSTGIVING_HOME_LINKS_TEXT = "JustGiving - Home"
  BACK_LINKS_TEXT = "Back"
  CONTINUE_LINKS_TEXT = /Continue/
  PAYMENT_BILLINGADDRESS_COUNTRY_SELECT_ID = "Payment_BillingAddress_Country"


  def get_Payment_BillingAddress_div
    @browser.div(:id, MAIN_DIV_ID).wait_until_present
    return @browser.div(:id, MAIN_DIV_ID)
  end


  # TEXT FIELD METHODS
  def enter_text_into_Payment_BillingAddress_HouseNumber(text)
    div = get_Payment_BillingAddress_div
    div.text_field(:id, PAYMENT_BILLINGADDRESS_HOUSENUMBER_TEXTFIELDS_ID).set text
  end

  def clear_text_from_Payment_BillingAddress_HouseNumber
    div = get_Payment_BillingAddress_div
    div.text_field(:id, PAYMENT_BILLINGADDRESS_HOUSENUMBER_TEXTFIELDS_ID).clear
  end

  def return_value_from_textfield_Payment_BillingAddress_HouseNumber
    div = get_Payment_BillingAddress_div
    return div.text_field(:id, PAYMENT_BILLINGADDRESS_HOUSENUMBER_TEXTFIELDS_ID).value
  end

  def enter_text_into_Payment_BillingAddress_AddressLine1(text)
    div = get_Payment_BillingAddress_div
    div.text_field(:id, PAYMENT_BILLINGADDRESS_ADDRESSLINE1_TEXTFIELDS_ID).set text
  end

  def clear_text_from_Payment_BillingAddress_AddressLine1
    div = get_Payment_BillingAddress_div
    div.text_field(:id, PAYMENT_BILLINGADDRESS_ADDRESSLINE1_TEXTFIELDS_ID).clear
  end

  def return_value_from_textfield_Payment_BillingAddress_AddressLine1
    div = get_Payment_BillingAddress_div
    return div.text_field(:id, PAYMENT_BILLINGADDRESS_ADDRESSLINE1_TEXTFIELDS_ID).value
  end

  def enter_text_into_Payment_BillingAddress_AddressLine2(text)
    div = get_Payment_BillingAddress_div
    div.text_field(:id, PAYMENT_BILLINGADDRESS_ADDRESSLINE2_TEXTFIELDS_ID).set text
  end

  def clear_text_from_Payment_BillingAddress_AddressLine2
    div = get_Payment_BillingAddress_div
    div.text_field(:id, PAYMENT_BILLINGADDRESS_ADDRESSLINE2_TEXTFIELDS_ID).clear
  end

  def return_value_from_textfield_Payment_BillingAddress_AddressLine2
    div = get_Payment_BillingAddress_div
    return div.text_field(:id, PAYMENT_BILLINGADDRESS_ADDRESSLINE2_TEXTFIELDS_ID).value
  end

  def enter_text_into_Payment_BillingAddress_Town(text)
    div = get_Payment_BillingAddress_div
    div.text_field(:id, PAYMENT_BILLINGADDRESS_TOWN_TEXTFIELDS_ID).set text
  end

  def clear_text_from_Payment_BillingAddress_Town
    div = get_Payment_BillingAddress_div
    div.text_field(:id, PAYMENT_BILLINGADDRESS_TOWN_TEXTFIELDS_ID).clear
  end

  def return_value_from_textfield_Payment_BillingAddress_Town
    div = get_Payment_BillingAddress_div
    return div.text_field(:id, PAYMENT_BILLINGADDRESS_TOWN_TEXTFIELDS_ID).value
  end

  def enter_text_into_Payment_BillingAddress_County(text)
    div = get_Payment_BillingAddress_div
    div.text_field(:id, PAYMENT_BILLINGADDRESS_COUNTY_TEXTFIELDS_ID).set text
  end

  def clear_text_from_Payment_BillingAddress_County
    div = get_Payment_BillingAddress_div
    div.text_field(:id, PAYMENT_BILLINGADDRESS_COUNTY_TEXTFIELDS_ID).clear
  end

  def return_value_from_textfield_Payment_BillingAddress_County
    div = get_Payment_BillingAddress_div
    return div.text_field(:id, PAYMENT_BILLINGADDRESS_COUNTY_TEXTFIELDS_ID).value
  end

  def enter_text_into_Payment_BillingAddress_Postcode(text)
    div = get_Payment_BillingAddress_div
    div.text_field(:id, PAYMENT_BILLINGADDRESS_POSTCODE_TEXTFIELDS_ID).set text
  end

  def clear_text_from_Payment_BillingAddress_Postcode
    div = get_Payment_BillingAddress_div
    div.text_field(:id, PAYMENT_BILLINGADDRESS_POSTCODE_TEXTFIELDS_ID).clear
  end

  def return_value_from_textfield_Payment_BillingAddress_Postcode
    div = get_Payment_BillingAddress_div
    return div.text_field(:id, PAYMENT_BILLINGADDRESS_POSTCODE_TEXTFIELDS_ID).value
  end



  # BUTTON METHODS


  # LINK METHODS
  def click_JustGiving_Home_link
    div = get_Payment_BillingAddress_div
    div.link(:text, JUSTGIVING_HOME_LINKS_TEXT).click
  end

  def return_JustGiving_Home_link_text
    div = get_Payment_BillingAddress_div
    return div.link(:text, JUSTGIVING_HOME_LINKS_TEXT).value
  end

  def click_Back_link
    div = get_Payment_BillingAddress_div
    div.link(:text, BACK_LINKS_TEXT).click
  end

  def return_Back_link_text
    div = get_Payment_BillingAddress_div
    return div.link(:text, BACK_LINKS_TEXT).value
  end

  def click_Continue_link
    div = get_Payment_BillingAddress_div
    div.link(:text, CONTINUE_LINKS_TEXT).click
  end

  def return_Continue_link_text
    div = get_Payment_BillingAddress_div
    return div.link(:text, CONTINUE_LINKS_TEXT).value
  end



  # SELECT METHODS
  def click_Payment_BillingAddress_Country_select(option)
    div = get_Payment_BillingAddress_div
    div.select(:id, PAYMENT_BILLINGADDRESS_COUNTRY_SELECT_ID).select option
  end

  def return_options_Payment_BillingAddress_Country_link_select
    div = get_Payment_BillingAddress_div
    return div.select(:id, PAYMENT_BILLINGADDRESS_COUNTRY_SELECT_ID).options
  end



  # RADIO METHODS


  # CHECKBOX METHODS

end