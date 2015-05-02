# encoding: utf-8
# class documentation

# page built from: https://www.justgiving.com/4w350m3/donation/direct/charity/2157#Payment

class Payment_jg
  include PageInitializer

  # Element identifiers
  MAIN_DIV_ID = "Payment"

  PAYMENT_CARDNUMBER_TEXTFIELDS_ID = "Payment_CardNumber"
  PAYMENT_NAMEONCARD_TEXTFIELDS_ID = "Payment_NameOnCard"
  JUSTGIVING_HOME_LINKS_TEXT = "JustGiving - Home"
  BACK_LINKS_TEXT = "Back"
  CONTINUE_LINKS_TEXT = /Continue/

  PAYMENT_CARDTYPE_SELECT_ID = "Payment_CardType"
  PAYMENT_EXPIRYDATEPART_MONTH_SELECT_ID = "Payment_ExpiryDatePart_Month"
  PAYMENT_EXPIRYDATEPART_YEAR_SELECT_ID = "Payment_ExpiryDatePart_Year"
  PAYMENT_REMEMBERPAYMENTDETAILS_CHKBOX_ID = "Payment_RememberPaymentDetails"


  def get_Payment_div
    @browser.div(:id, MAIN_DIV_ID).wait_until_present
    return @browser.div(:id, MAIN_DIV_ID)
  end


  # TEXT FIELD METHODS
  def enter_text_into_Payment_CardNumber(text)
    div = get_Payment_div
    div.text_field(:id, PAYMENT_CARDNUMBER_TEXTFIELDS_ID).set text
  end

  def clear_text_from_Payment_CardNumber
    div = get_Payment_div
    div.text_field(:id, PAYMENT_CARDNUMBER_TEXTFIELDS_ID).clear
  end

  def return_value_from_textfield_Payment_CardNumber
    div = get_Payment_div
    return div.text_field(:id, PAYMENT_CARDNUMBER_TEXTFIELDS_ID).value
  end

  def enter_text_into_Payment_NameOnCard(text)
    div = get_Payment_div
    div.text_field(:id, PAYMENT_NAMEONCARD_TEXTFIELDS_ID).set text
  end

  def clear_text_from_Payment_NameOnCard
    div = get_Payment_div
    div.text_field(:id, PAYMENT_NAMEONCARD_TEXTFIELDS_ID).clear
  end

  def return_value_from_textfield_Payment_NameOnCard
    div = get_Payment_div
    return div.text_field(:id, PAYMENT_NAMEONCARD_TEXTFIELDS_ID).value
  end



  # BUTTON METHODS


  # LINK METHODS
  def click_JustGiving_Home_link
    div = get_Payment_div
    div.link(:text, JUSTGIVING_HOME_LINKS_TEXT).click
  end

  def return_JustGiving_Home_link_text
    div = get_Payment_div
    return div.link(:text, JUSTGIVING_HOME_LINKS_TEXT).value
  end

  def click_Back_link
    div = get_Payment_div
    div.link(:text, BACK_LINKS_TEXT).click
  end

  def return_Back_link_text
    div = get_Payment_div
    return div.link(:text, BACK_LINKS_TEXT).value
  end

  def click_Continue_link
    div = get_Payment_div
    div.link(:text, CONTINUE_LINKS_TEXT).click
  end

  def return_Continue_link_text
    div = get_Payment_div
    return div.link(:text, CONTINUE_LINKS_TEXT).value
  end



  # SELECT METHODS
  def click_Payment_CardType_select(option)
    div = get_Payment_div
    div.select(:id, PAYMENT_CARDTYPE_SELECT_ID).select option
  end

  def return_options_Payment_CardType_link_select
    div = get_Payment_div
    return div.select(:id, PAYMENT_CARDTYPE_SELECT_ID).options
  end

  def click_Payment_ExpiryDatePart_Month_select(option)
    div = get_Payment_div
    div.select(:id, PAYMENT_EXPIRYDATEPART_MONTH_SELECT_ID).select option
  end

  def return_options_Payment_ExpiryDatePart_Month_link_select
    div = get_Payment_div
    return div.select(:id, PAYMENT_EXPIRYDATEPART_MONTH_SELECT_ID).options
  end

  def click_Payment_ExpiryDatePart_Year_select(option)
    div = get_Payment_div
    div.select(:id, PAYMENT_EXPIRYDATEPART_YEAR_SELECT_ID).select option
  end

  def return_options_Payment_ExpiryDatePart_Year_link_select
    div = get_Payment_div
    return div.select(:id, PAYMENT_EXPIRYDATEPART_YEAR_SELECT_ID).options
  end



  # RADIO METHODS


  # CHECKBOX METHODS
  def set_checkbox_Payment_RememberPaymentDetails
    div = get_Payment_div
    div.checkbox(:id, PAYMENT_REMEMBERPAYMENTDETAILS_CHKBOX_ID).set
  end

  def clear_checkbox_Payment_RememberPaymentDetails
    div = get_Payment_div
    div.checkbox(:id, PAYMENT_REMEMBERPAYMENTDETAILS_CHKBOX_ID).clear
  end

  def return_value_from_checkbox_Payment_RememberPaymentDetails
    div = get_Payment_div
    return div.checkbox(:id, PAYMENT_REMEMBERPAYMENTDETAILS_CHKBOX_ID).value
  end


end